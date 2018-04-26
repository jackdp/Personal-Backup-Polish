# Polish translation for Personal Backup

[Polish version / Polska wersja](Readme_PL.md)

## Overview

**Personal Backup** is an advanced file backup program.

The program allows you to add files to the backup using user-defined filters, works with the Windows Task Scheduler, allows you to create any number of backup projects (tasks), supports the creation of incremental and differential backups, saving copies to network and FTP drives, supports Volume Shadow Copies, compression, encryption and much, much more.  
You can find more information on the program's [home page](http://personal-backup.rathlev-home.de/index-e.html), and in detailed [documentation](http://personal-backup.rathlev-home.de/help-en/pb-inhalt.html).

The author of the program is Dr. Jürgen Rathlev. On his website you can also find a lot of other interesting programs and resources for Delphi / Pascal programmers.

Jürgen updated the German translation of one of my programs, so I decided to return the favor by translating the Personal Backup into my native language - Polish.

The task was not easy at all! There are several additional programs installed with the Personal Backup. The number of text strings used by all these programs exceeds 2500. It was work for the whole week.

## Download

Source (PO files): https://github.com/jackdp/Personal-Backup-Polish  
Binary (MO files): http://www.pazera-software.com/misc/personal-backup-pl/Personal_Backup_PL.zip

## Installation

- Download this repository and compile all `.po` files to `.mo` with some PO editor/compiler (personally, I usually use [Poedit](https://github.com/vslavik/poedit)).
- Close Personal Backup program if it is running.
- Go to the folder you selected when installing Personal Backup. The default folder on Windows 32-bit is `C:\Program Files\Personal Backup 5\`, 64-bit: `C:\Program Files (x86)\Personal Backup 5\`.
- Create directory tree (if not exists): **`locale\pl\LC_MESSAGES`**. You will probably need administrator rights.
- Copy compiled **.mo** files and `language.cfg` to **`LC_MESSAGES`** directory.
- Run Personal Backup, select menu `Preferences` --> `Language` --> `Polish`.

## Screenshot

![Screenshot](http://www.pazera-software.com/misc/personal-backup-pl/personal-backup-pl-01.png)

## Useful links

- Personal Backup home page: http://personal-backup.rathlev-home.de/index-e.html
- Online help: http://personal-backup.rathlev-home.de/help-en/pb-inhalt.html
- Useful information for program translators: http://personal-backup.rathlev-home.de/translate.html
- A large collections of Delphi units: http://www.rathlev-home.de/sources/delphi.html
- Polish translation on the GitHub: https://github.com/jackdp/Personal-Backup-Polish
- Compiled MO files are available at http://www.pazera-software.com/misc/personal-backup-pl/
