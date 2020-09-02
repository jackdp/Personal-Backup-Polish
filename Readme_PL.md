# Polskie tłumaczenie programu Personal Backup

[English version / Wersja angielska](Readme.md)

## Opis

**Personal Backup** jest zaawansowanym programem do tworzenia kopii zapasowych plików.

Program umożliwia dodawanie plików do kopii zapasowej na podstawie filtrów definiowanych przez użytkownika, współpracuje z Harmonogramem Zadań systemu Windows, pozwala utworzyć dowolną liczbę projektów (zadań) tworzenia kopii zapasowych, obsługuje kopie przyrostowe i różnicowe, zapis kopii na dyskach sieciowych i FTP, wspiera kopiowanie woluminów w tle (VSS), kompresję, szyfrowanie i dużo, dużo więcej.   
Dodatkowe informacje można znaleźć na [stronie domowej](http://personal-backup.rathlev-home.de/index-e.html) programu oraz w szczegółowej [dokumentacji](http://personal-backup.rathlev-home.de/help-en/pb-inhalt.html).

Autorem programu jest Dr. Jürgen Rathlev. Na stronie autora można też znaleźć sporo innych interesujących aplikacji oraz zasobów dla programistów Delphi / Pascala.

Jürgen zaktualizował niemieckie tłumaczenie jednego z moich programów, więc postanowiłem się odwdzięczyć pisząc polskie tłumaczenie programu Personal Backup.

Zadanie wcale nie było proste! Wraz z programem Personal Backup instalowanych jest jeszcze kilka dodatkowych aplikacji. Liczba łańcuchów tekstowych wykorzystywanych przez te wszystkie programy przekracza 2500\. To był cały tydzień pracy.

## Pliki

Pliki źródłowe (PO): https://github.com/jackdp/Personal-Backup-Polish  
Pliki skompilowane (MO): https://www.pazera-software.com/files/misc/Personal_Backup_PL.zip

## Instalacja

- Pobierz to repozytorium i skompiluj wszystkie pliki `.po` do plików `.mo` jakimś edytorem/kompilatorem plików PO (osobiście, zazwyczaj używam programu [Poedit](https://github.com/vslavik/poedit)).
- Zamknij Personal Backup, jeśli jest uruchomiony.
- Przejdź do katalogu, który wybrałeś przy instalacji Personal Backup. Domyślnym folderem instalatora na Windowsie 32-bitowym jest `C:\Program Files\Personal Backup 5\`, 64-bitowym: `C:\Program Files (x86)\Personal Backup 5\`.
- Utwórz drzewo katalogów (jeśli nie istnieje): **`locale\pl\LC_MESSAGES`**. Prawdopodobnie będą wymagane uprawnienia administratora.
- Skopiuj skompilowane pliki `.mo` oraz plik `language.cfg` do katalogu **`LC_MESSAGES`**.
- Uruchom Personal Backup, wybierz menu `Preferences` --> `Language` --> `Polish`.

## Zrzut ekranu

![Screenshot](https://www.pazera-software.com/files/misc/personal-backup-pl-01.png)

## Przydatne linki

- Strona domowa programu Personal Backup: http://personal-backup.rathlev-home.de/index-e.html
- Pomoc online: http://personal-backup.rathlev-home.de/help-en/pb-inhalt.html
- Przydatne informacje dla tłumaczy: http://personal-backup.rathlev-home.de/translate.html
- Spora kolekcja modułów dla Delphi / Pascala: http://www.rathlev-home.de/sources/delphi.html
- Polskie tłumaczenie na GitHubie: https://github.com/jackdp/Personal-Backup-Polish
- Skompilowane pliki MO można pobrać tutaj: http://www.pazera-software.com/misc/personal-backup-pl/
