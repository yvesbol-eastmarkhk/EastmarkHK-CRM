#!/usr/bin/env python3
"""Ajoute les clés l10n récentes (dictée / tâche créée) à tous les .arb.

- app_fr.arb : français
- app_en.arb + autres : anglais (sauf locales avec traduction ci-dessous)
"""
from __future__ import annotations

import json
import os

ARB_DIR = "lib/l10n"

# key -> {lang: text} ; 'fr' et 'en' obligatoires ; autres optionnels.
KEYS: dict[str, dict[str, str]] = {
    "activityTaskCreated": {
        "fr": "Tâche créée",
        "en": "Task created",
        "de": "Aufgabe erstellt",
        "es": "Tarea creada",
        "it": "Attività creata",
        "nl": "Taak aangemaakt",
        "pt": "Tarefa criada",
        "pt_BR": "Tarefa criada",
        "pl": "Utworzono zadanie",
        "ru": "Задача создана",
        "zh": "已创建任务",
        "ja": "タスクを作成しました",
        "ko": "작업이 생성됨",
        "ar": "تم إنشاء المهمة",
        "tr": "Görev oluşturuldu",
        "uk": "Завдання створено",
        "cs": "Úkol vytvořen",
        "ro": "Sarcină creată",
        "hu": "Feladat létrehozva",
        "sv": "Uppgift skapad",
        "da": "Opgave oprettet",
        "no": "Oppgave opprettet",
        "fi": "Tehtävä luotu",
        "el": "Η εργασία δημιουργήθηκε",
        "he": "המשימה נוצרה",
        "hi": "कार्य बनाया गया",
        "th": "สร้างงานแล้ว",
        "vi": "Đã tạo nhiệm vụ",
        "id": "Tugas dibuat",
        "ms": "Tugas dicipta",
    },
    "dictationOfflineTip": {
        "fr": "Dictée hors ligne — elle capture souvent le bruit (TV) au lieu de votre voix. Activez « Reconnaissance vocale en ligne » dans Paramètres Windows → Confidentialité → Discours, baissez le bruit, puis réessayez.",
        "en": "Offline dictation — it often picks up noise (TV) instead of your voice. Turn ON “Online speech recognition” in Windows Settings → Privacy → Speech, reduce background noise, then try again.",
        "de": "Offline-Diktat — oft wird Hintergrundgeräusch (TV) statt Ihrer Stimme erkannt. Aktivieren Sie „Online-Spracherkennung“ unter Windows-Einstellungen → Datenschutz → Sprache, reduzieren Sie Lärm und versuchen Sie es erneut.",
        "es": "Dictado sin conexión: a menudo captura el ruido (TV) en lugar de su voz. Active el «reconocimiento de voz en línea» en Configuración de Windows → Privacidad → Voz, reduzca el ruido y vuelva a intentarlo.",
        "it": "Dettatura offline: spesso cattura il rumore (TV) invece della voce. Attiva il «riconoscimento vocale online» in Impostazioni Windows → Privacy → Voce, riduci il rumore e riprova.",
        "nl": "Offline dictee — pikt vaak lawaai (TV) op in plaats van uw stem. Zet «Online spraakherkenning» aan in Windows-instellingen → Privacy → Spraak, verminder achtergrondgeluid en probeer opnieuw.",
        "pt": "Ditado offline — capta frequentemente o ruído (TV) em vez da sua voz. Ative o «reconhecimento de voz online» em Definições do Windows → Privacidade → Voz, reduza o ruído e tente novamente.",
        "pt_BR": "Ditado offline — costuma captar o ruído (TV) em vez da sua voz. Ative o «reconhecimento de fala online» em Configurações do Windows → Privacidade → Fala, reduza o ruído e tente de novo.",
        "zh": "离线听写——常会识别到噪音（电视）而非您的声音。请在 Windows 设置 → 隐私 → 语音 中开启“联机语音识别”，降低环境噪音后重试。",
        "ja": "オフライン音声入力は、声ではなく周囲の音（テレビなど）を拾いがちです。Windows の設定 → プライバシー → 音声で「オンライン音声認識」をオンにし、ノイズを減らしてから再試行してください。",
        "ko": "오프라인 받아쓰기는 목소리 대신 소음(TV)을 인식하는 경우가 많습니다. Windows 설정 → 개인 정보 → 음성에서 “온라인 음성 인식”을 켠 뒤 소음을 줄이고 다시 시도하세요.",
        "ar": "الإملاء دون اتصال يلتقط غالبًا الضوضاء (التلفاز) بدل صوتك. فعّل «التعرّف على الكلام عبر الإنترنت» في إعدادات Windows → الخصوصية → الكلام، قلّل الضوضاء ثم أعد المحاولة.",
        "ru": "Офлайн-диктовка часто распознаёт шум (ТВ), а не ваш голос. Включите «Распознавание речи через Интернет» в параметрах Windows → Конфиденциальность → Речь, снизьте шум и повторите.",
        "pl": "Dyktowanie offline — często przechwytuje hałas (TV) zamiast głosu. Włącz «Rozpoznawanie mowy online» w Ustawieniach Windows → Prywatność → Mowa, zmniejsz hałas i spróbuj ponownie.",
        "tr": "Çevrimdışı dikte — genelde sesiniz yerine gürültüyü (TV) alır. Windows Ayarları → Gizlilik → Konuşma içinde «Çevrimiçi konuşma tanıma»yı açın, gürültüyü azaltın ve yeniden deneyin.",
        "uk": "Офлайн-диктування часто розпізнає шум (ТВ), а не ваш голос. Увімкніть «Розпізнавання мовлення через Інтернет» у Параметри Windows → Конфіденційність → Мовлення, зменште шум і повторіть.",
        "cs": "Offline diktování — často zachytí hluk (TV) místo vašeho hlasu. Zapněte „Online rozpoznávání řeči“ v Nastavení Windows → Soukromí → Řeč, snižte hluk a zkuste znovu.",
        "ro": "Dictare offline — deseori capturează zgomotul (TV) în locul vocii. Activați «Recunoașterea vorbirii online» în Setări Windows → Confidențialitate → Vorbire, reduceți zgomotul și reîncercați.",
        "hu": "Offline diktálás — gyakran a zajt (TV) ismeri fel a hangja helyett. Kapcsolja be az „Online beszédfelismerést” a Windows Beállítások → Adatvédelem → Beszéd menüpontban, csökkentse a zajt, majd próbálja újra.",
        "sv": "Offline-diktering fångar ofta brus (TV) i stället för din röst. Aktivera ”Online-taligenkänning” i Windows-inställningar → Sekretess → Tal, minska bakgrundsljudet och försök igen.",
        "da": "Offline-diktering opfanger ofte støj (TV) i stedet for din stemme. Slå »Online talegenkendelse« til i Windows-indstillinger → Fortrolighed → Tale, dæmp støjen og prøv igen.",
        "no": "Frakoblet diktering plukker ofte opp støy (TV) i stedet for stemmen din. Slå på «Online talegjenkjenning» i Windows-innstillinger → Personvern → Tale, demp støyen og prøv igjen.",
        "fi": "Offline-sanelu poimii usein melua (TV) äänesi sijaan. Ota «Online-puheentunnistus» käyttöön Windowsin asetuksissa → Tietosuoja → Puhe, vähennä melua ja yritä uudelleen.",
        "el": "Η υπαγόρευση εκτός σύνδεσης συχνά συλλαμβάνει θόρυβο (TV) αντί της φωνής σας. Ενεργοποιήστε την «Αναγνώριση ομιλίας μέσω Διαδικτύου» στις Ρυθμίσεις Windows → Απόρρητο → Ομιλία, μειώστε τον θόρυβο και δοκιμάστε ξανά.",
        "he": "הכתבה לא מקוונת לרוב קולטת רעש (טלוויזיה) במקום את קולכם. הפעילו «זיהוי דיבור מקוון» בהגדרות Windows → פרטיות → דיבור, הפחיתו רעש ונסו שוב.",
        "hi": "ऑफ़लाइन डिक्टेशन अक्सर आपकी आवाज़ की बजाय शोर (टीवी) पकड़ता है। Windows सेटिंग्स → गोपनीयता → वाक् में «ऑनलाइन वाक् पहचान» चालू करें, शोर कम करें और फिर कोशिश करें।",
        "th": "การบอกพิมพ์แบบออฟไลน์มักจับเสียงรบกวน (ทีวี) แทนเสียงของคุณ เปิด «การรู้จำเสียงออนไลน์» ใน การตั้งค่า Windows → ความเป็นส่วนตัว → คำพูด ลดเสียงรบกวนแล้วลองใหม่",
        "vi": "Chính tả ngoại tuyến thường nhận tiếng ồn (TV) thay vì giọng bạn. Bật «Nhận dạng giọng nói trực tuyến» trong Cài đặt Windows → Quyền riêng tư → Lời nói, giảm tiếng ồn rồi thử lại.",
        "id": "Dikte offline sering menangkap kebisingan (TV) alih-alih suara Anda. Aktifkan «Pengenalan ucapan online» di Pengaturan Windows → Privasi → Ucapan, kurangi kebisingan, lalu coba lagi.",
        "ms": "Dikte luar talian sering menangkap hingar (TV) bukan suara anda. Hidupkan «Pengecaman pertuturan dalam talian» dalam Tetapan Windows → Privasi → Pertuturan, kurangkan hingar, kemudian cuba lagi.",
    },
    "dictationLanguageFallbackTip": {
        "fr": "Cette variante de langue n’est pas installée sur Windows — une variante proche est utilisée. Installez le pack Speech souhaité dans Paramètres → Heure et langue → Speech.",
        "en": "This language variant is not installed on Windows — a close match is used. Install the desired speech pack in Settings → Time & language → Speech.",
        "de": "Diese Sprachvariante ist unter Windows nicht installiert — es wird eine ähnliche Variante verwendet. Installieren Sie das gewünschte Sprachpaket unter Einstellungen → Zeit und Sprache → Sprache.",
        "es": "Esta variante de idioma no está instalada en Windows: se usa una variante cercana. Instale el paquete de voz en Configuración → Hora e idioma → Voz.",
        "it": "Questa variante di lingua non è installata su Windows: viene usata una variante simile. Installa il pacchetto vocale in Impostazioni → Ora e lingua → Voce.",
        "nl": "Deze taalvariant is niet geïnstalleerd op Windows — er wordt een nauwe match gebruikt. Installeer het gewenste spraakpakket via Instellingen → Tijd en taal → Spraak.",
        "pt": "Esta variante de idioma não está instalada no Windows — é usada uma variante próxima. Instale o pacote de voz em Definições → Hora e idioma → Voz.",
        "pt_BR": "Esta variante de idioma não está instalada no Windows — uma variante próxima é usada. Instale o pacote de fala em Configurações → Hora e idioma → Fala.",
        "zh": "Windows 未安装此语言变体——将使用相近变体。请在设置 → 时间和语言 → 语音中安装所需语音包。",
        "ja": "この言語バリアントは Windows にインストールされていません。近い言語を使用します。設定 → 時刻と言語 → 音声 で目的の音声パックをインストールしてください。",
        "ko": "이 언어 변형은 Windows에 설치되어 있지 않습니다. 가까운 변형을 사용합니다. 설정 → 시간 및 언어 → 음성에서 원하는 음성 팩을 설치하세요.",
        "ar": "متغير اللغة هذا غير مثبت على Windows — يُستخدم متغير قريب. ثبّت حزمة الكلام المطلوبة من الإعدادات → الوقت واللغة → الكلام.",
        "ru": "Этот вариант языка не установлен в Windows — используется близкий вариант. Установите нужный языковой пакет: Параметры → Время и язык → Речь.",
        "pl": "Ta odmiana języka nie jest zainstalowana w Windows — używana jest zbliżona. Zainstaluj żądany pakiet mowy w Ustawienia → Czas i język → Mowa.",
        "tr": "Bu dil varyantı Windows’ta yüklü değil — yakın bir eşleşme kullanılıyor. İstediğiniz konuşma paketini Ayarlar → Saat ve dil → Konuşma bölümünden yükleyin.",
        "uk": "Цей варіант мови не встановлено у Windows — використовується близький. Встановіть потрібний мовний пакет: Параметри → Час і мова → Мовлення.",
        "cs": "Tato jazyková varianta není ve Windows nainstalována — použije se blízká. Nainstalujte požadovaný balíček řeči v Nastavení → Čas a jazyk → Řeč.",
        "ro": "Această variantă de limbă nu este instalată pe Windows — se folosește una apropiată. Instalați pachetul de vorbire dorit în Setări → Oră și limbă → Vorbire.",
        "hu": "Ez a nyelvi változat nincs telepítve a Windowsban — közeli változatot használunk. Telepítse a kívánt beszédcsomagot: Beállítások → Idő és nyelv → Beszéd.",
        "sv": "Denna språkvariant är inte installerad i Windows — en nära matchning används. Installera önskat talpaket i Inställningar → Tid och språk → Tal.",
        "da": "Denne sprogvariant er ikke installeret i Windows — en tæt match bruges. Installer den ønskede talepakke i Indstillinger → Tid og sprog → Tale.",
        "no": "Denne språkvarianten er ikke installert i Windows — en nær match brukes. Installer ønsket talepakke i Innstillinger → Tid og språk → Tale.",
        "fi": "Tätä kielivarianttia ei ole asennettu Windowsiin — käytetään läheistä vastinetta. Asenna haluttu puhepaketti: Asetukset → Aika ja kieli → Puhe.",
        "el": "Αυτή η παραλλαγή γλώσσας δεν είναι εγκατεστημένη στα Windows — χρησιμοποιείται μια κοντινή. Εγκαταστήστε το επιθυμητό πακέτο ομιλίας στις Ρυθμίσεις → Ώρα και γλώσσα → Ομιλία.",
        "he": "וריאנט השפה הזה אינו מותקן ב-Windows — נעשה שימוש בהתאמה קרובה. התקינו את חבילת הדיבור הרצויה בהגדרות → שעה ושפה → דיבור.",
        "hi": "यह भाषा संस्करण Windows पर स्थापित नहीं है — निकट मिलान का उपयोग होता है। सेटिंग्स → समय और भाषा → वाक् में वांछित स्पीच पैक स्थापित करें।",
        "th": "ตัวแปรภาษานี้ไม่ได้ติดตั้งบน Windows — จะใช้ตัวแปรที่ใกล้เคียง ติดตั้งแพ็กเสียงที่ต้องการใน การตั้งค่า → เวลาและภาษา → คำพูด",
        "vi": "Biến thể ngôn ngữ này chưa được cài trên Windows — đang dùng biến thể gần. Cài gói lời nói mong muốn trong Cài đặt → Thời gian & ngôn ngữ → Lời nói.",
        "id": "Varian bahasa ini tidak terpasang di Windows — digunakan kecocokan terdekat. Instal paket ucapan yang diinginkan di Pengaturan → Waktu & bahasa → Ucapan.",
        "ms": "Varian bahasa ini tidak dipasang pada Windows — padanan rapat digunakan. Pasang pek pertuturan yang dikehendaki dalam Tetapan → Masa & bahasa → Pertuturan.",
    },
    "dictationStarting": {
        "fr": "Démarrage de la dictée…",
        "en": "Starting dictation…",
        "de": "Diktat wird gestartet…",
        "es": "Iniciando el dictado…",
        "it": "Avvio della dettatura…",
        "nl": "Dictee starten…",
        "pt": "A iniciar o ditado…",
        "pt_BR": "Iniciando o ditado…",
        "zh": "正在启动听写…",
        "ja": "音声入力を開始しています…",
        "ko": "받아쓰기 시작 중…",
        "ar": "جارٍ بدء الإملاء…",
        "ru": "Запуск диктовки…",
        "pl": "Uruchamianie dyktowania…",
        "tr": "Dikte başlatılıyor…",
        "uk": "Запуск диктування…",
        "cs": "Spouštění diktování…",
        "ro": "Se pornește dictarea…",
        "hu": "Diktálás indítása…",
        "sv": "Startar diktering…",
        "da": "Starter diktering…",
        "no": "Starter diktering…",
        "fi": "Aloitetaan sanelu…",
        "el": "Έναρξη υπαγόρευσης…",
        "he": "מתחילים הכתבה…",
        "hi": "डिक्टेशन शुरू हो रहा है…",
        "th": "กำลังเริ่มการบอกพิมพ์…",
        "vi": "Đang bắt đầu chính tả…",
        "id": "Memulai dikte…",
        "ms": "Memulakan dikte…",
    },
}


def lang_of(fname: str) -> str:
    # app_fr.arb -> fr ; app_pt_BR.arb -> pt_BR
    base = fname.removeprefix("app_").removesuffix(".arb")
    return base


def main() -> None:
    files = sorted(f for f in os.listdir(ARB_DIR) if f.endswith(".arb"))
    for fname in files:
        path = os.path.join(ARB_DIR, fname)
        with open(path, encoding="utf-8") as f:
            data = json.load(f)
        lang = lang_of(fname)
        added = 0
        for key, texts in KEYS.items():
            if key in data:
                continue
            data[key] = texts.get(lang) or texts["en"]
            added += 1
        with open(path, "w", encoding="utf-8") as f:
            json.dump(data, f, ensure_ascii=False, indent=2)
            f.write("\n")
        print(f"{fname}: +{added}")


if __name__ == "__main__":
    main()
