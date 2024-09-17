Základem pro úspěšnou práci s Linuxem je dokumentace. Část najdete přímo
v nainstalovaném systému, zbytek pak na Internetu nebo přímo ve
zdrojových kódech (např. jako komentáře).

Manuálové stránky
-----------------

Nejstarší dokumentace je ve formě manuálových stránek. Ty jsou zapsány v
souborech, které najdete v adresáři `/usr/share/man`. Zde naleznete
podadresáře `man1` až `man9`, které obsahují jednotlivé manuálové
stránky roztříděné do sekcí podle následujícího seznamu:

### Sekce manuálových stránek

1.  uživatelské příkazy
2.  služby jádra systému
3.  knihovní funkce jazyka C
4.  zařízení a ovladače zařízení
5.  formáty souborů a protokoly (wtmp, /etc/passwd, nfs, \...)
6.  triviální aplikační programy, hry
7.  různé (např. nroff, ascii, utf-8, url, \...)
8.  administrátorské příkazy, správa systému

Překlady manuálových stránek jsou uloženy v adresářích, které odpovídají
příslušné zkratce jazyka (české v adresáři cs, slovenské v adresáři sk a
podobně). Překlady jsou dále děleny podle sekcí zmíněných výše.

V následujícím příkladu je nejprve zobrazena manuálová stránka o
programu `passwd` (ze sekce 1), na druhém řádku pak manuálová stránka
popisující formát souboru `/etc/passwd` ze sekce 5 (existenci dvou
stejnojmenných manuálových stránek v různých sekcích srovnejte s
výstupem příkazů `whatis` a `apropos` níže).

`$ man passwd`\
`$ man 5 passwd`

### Zobrazení manuálových stránek

Manuálové stránky lze prohlížet několika způsoby. Prvním a nejstarším je
příkaz `man`, který umožňuje manuálové stránky naformátovat příkazem
`nroff` a zobrazit pomocí filtru `less`. Ve většině případů jsou
manuálové stránky uloženy na disku v komprimovaném stavu, takže příkaz
`man` je musí před formátovám ještě rozbalit (například nástrojem
`gunzip`). Příkaz `man` provádí všechny potřebné mezikroky automaticky a
pro zvětšení rychlosti zobrazení stránky si ukládá předformátované
soubory do adresáře `/var/cache/man`.

Po zobrazení je manuálová stránka předána speciálnímu programu `less`,
pomocí kterého můžete v textu listovat:

-   vpřed - mezerník, šipka dolů, Enter, Page Down
-   vzad - šipka nahoru, b, Page Up
-   vyhledávat text - stiskněte dopředné lomítko a pak ihned napište
    hledaný text a stiskněte Enter
-   najít další výskyt - stiskněte písmeno n
-   najít předchozí - stiskněte písmeno N
-   ukončit prohlížení manuálové stránky - stiskněte písmeno q
-   nápověda - stiskněte písmeno h

Manuálová stránka je zobrazena v národním jazyce, pokud je k dispozici
její překlad. České překlady jsou k dispozici v balíčku
[`man-pages-cs`](man-pages-cs "wikilink"), obdobně překlady i pro
ostatní jazyky. Překlady mohou být někdy zastaralé, proto je vhodné
konzultovat i originální manálovou stránku v angličtině:

`$ man man          # nápověda pro příkaz man`\
`$ man --help       # stručná nápověda pro příkaz man`\
`$ man whatis`\
`$ man apropos`\
`$ man 5 passwd     # nápověda pro soubor passwd (ze sekce 5)`\
`$ man cp           # nápověda pro příkaz cp`\
`$ LANG=cs man cp   # nápověda pro příkaz cp v češtině (je-li k dispozici)`\
`$ LANG=sk man cp   # nápověda pro příkaz cp ve slovenštině`\
`$ LANG=C  man cp   # nápověda pro příkaz cp v angličtině`\
`$ LC_ALL=C man cp  # nejsilnější požadavek na anglickou variantu`

### Prohledávání manuálových stránek

K prohledávání manuálových stránek slouží příkaz `whatis` (zobrazí
všechny manuálové stránky, které mají v názvu hledaný výraz) a
`apropos`, který prohledává i stručné popisky manuálových stránek.
Databázi pro tyto dva příkazy je potřeba předem vytvořit pomocí příkazu
`makewhatis`, o což se obvykle stará automatický skript spouštěný
démonem `cron`.

`$ whatis passwd`\
`$ apropos passwd`

### Tisk manuálové stránky

Prohlížená manuálová stránka není ve vhodném tvaru pro tisk. Využijeme
tedy příkazu `col`, který odstraní řídící znaky pro zobrazení na
terminálu. Výsledný soubor `tisk.txt` je již možné otevřít v běžném
editoru.

` man ls | col -bf > tisk.txt`

Manuálové stránky jsou uloženy v adresáři `/usr/share/man/manKÓDSEKCE`,
překlady pak v adresářích `/usr/share/man/ZKRATKA`, kde zkratka je kód
příslušného locale (jazyka). Pokud nejsou příslušné překlady
nainstalovány, zobrazí se anglická verze (je-li přítomna).

Formát Info {#formát_info}
-----------

Dokumentace ke GNU považuje manuálové stránky za zastaralé, a proto je k
dispozici i formát *info*, který obsahuje možnosti tvorby hypertextových
odkazů (na zvýrazněné termíny lze kliknout a přenést se tak na jiné
místo). Příkaz `info` není pro běžné používání příliš příjemný, a proto
doporučuji použít příkaz `pinfo`, který se ovládá velmi příjemně šipkami
(Enter je vstup do odkazu, šipka vlevo je zpět) a disponuje i barevným
zvýrazňováním. Oba příkazy jsou schopné zobrazit i běžné manuálové
stránky, ovšem bez podpory překladů.

`info grep`\
`pinfo grep`

Soubory s dokumentací ve formátu GNU Info jsou obvykle v adresáři
`/usr/share/info`.

Nápověda v grafickém prostředí
------------------------------

Manuálové stránky lze velmi pěkně zobrazit i v grafickém prostředí, kde
existuje obvykle univerzální nástroj pro nápovědu, prohledávání i tisk.

Dokumentace k jednotlivým programům
-----------------------------------

Dokumentace k jednotlivým programům je umístěna v adresáři
`/usr/share/doc`, kde naleznete podadresáře se jmény příslušných
programů. V nich pak naleznete nejrůznější doplňující informace (pokud
je dal autor programu k dispozici).

Projekt LDP
-----------

Pro obecnější texty a popisy postupů (tzv. HOWTO, FAQ) se vydejte na
adresu [http://www.tldp.org](http://www.tldp.org).

Projekt LDP (The Linux Documentation Project) by částečně přeložen do
češtiny v nakladatelství Computer Press, který si můžete prohlédnou i na
adrese [http://ftp.linux.cz/pub/linux/people/milan_kerslager/ldp3/](http://ftp.linux.cz/pub/linux/people/milan_kerslager/ldp3/),
protože je vydavatel díky licenci GPL uvolnil i ve formátu PDF.

Další zdroje informací
----------------------

Na Internetu pak naleznete spoustu dalších míst, které se věnují Linuxu:

- [https://cs.wikipedia.org](https://cs.wikipedia.org/wiki/Manu%C3%A1lov%C3%A1_str%C3%A1nka) na české Wikipedii
- [http://www.linux.cz](http://www.linux.cz) stránky o jádře atd.
- [http://www.root.cz](http://www.root.cz) webový magazín, denní zprávičky
- [http://www.abclinuxu.cz](http://www.abclinuxu.cz) webový občasník, denní zprávičky

Autorem původního textu: [https://www.pslib.cz/milan.kerslager/Linux]{Milan Keslager}