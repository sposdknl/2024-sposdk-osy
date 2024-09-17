Konzole je klávesnice a displej, který je připojen přímo k počítači.
Dnes tedy většina uživatelů pracuje přímo na konzoli, ale dříve to
nebylo obvyklé, protože ke konzoli měl přístup jen správce počítače a
ostatní se připojovali z terminálů.

Ovládání [příkazového řádku v Unixu](Příkazový_řádek_v_Unixu "wikilink")
je v samostatném článku.

Grafický režim
--------------

[thumb\|Grafické uživatelské prostředí Linuxu (distribuce Fedora):
spuštěn Firefox a terminál, kde se uživatel pomocí příkazu \"su -\"
změnil na roota (správce
systému)](Soubor:GUI_-_Firefox_a_terminál.png "wikilink") Grafické
uživatelské prostředí (GUI -- *Graphical User Interface*) zná většina
uživatelů, protože je grafický režim spolu s GUI po startu počítače
automaticky spuštěn. V GUI je možné pracovat s okny a myší, používat
různé velikosti a tvary písma, obrázky atd. Jádro Linuxu chápe grafický
režim jako další virtuální konzoli, takže je možné spustit několik na
sobě nezávislých grafických prostředí, avšak tato možnost se obvykle
nepoužívá. V každém případě jsou typicky kromě grafické konzole k
dispozici textové konzole, do kterých se z grafické dá přepnout pomocí
kombinace kláves CTRL+ALT+F1 až CTRL+ALT+F6. Zpět do GUI se pak
přepínáme pomocí ALT+F7 (někdy též ALT+F1 v závislosti na to, na jaké
virtuální konzoli bylo GUI aktivováno).

### Terminál v GUI

Většina návodů, které zde nebo na Internetu najdete, předkládá uživateli
příkazy, které je nutné zadat do příkazového řádku. Výhodou tohoto
přístupu je, že příkaz obsahuje v jednom řádku všechny potřebné
přepínače, které zajistí zamýšlenou funkci. Grafická udělátka naopak
vyžadují kliknout na mnoho míst a navíc je jejich vzhled a popisky v
každém jazyce jiný.

Aby bylo možné v grafickém uživatelském prostředí zadávat příkazy, je
nutné využít speciální program, který se jmenuje terminálová emulace.
Jde o grafický program, který vytvoří okno, uvnitř kterého je k
dispozici textová plocha s neproporcionálními znaky rozmístěnými
šachovnicově stejným způsobem, jako je terminál v textovém režimu.
Program se tedy jmenuje terminálová emulace proto, že vytváří textový
terminál v původním slova smyslu uvnitř okna grafické aplikace. Uvnitř
tohoto okna je spuštěn klasický shell, který vytvoří příkazový řádek.

### Správa systému

Správce systému (root) je uživatel, který má v systému absolutní práva.
Proto je schopen systém spravovat (instalovat aplikace, měnit systémová
nastavení), ale zároveň i systému uškodit. Proto je neopatrné se do
grafického prostředí přihlašovat jako root. Z tohoto důvodu se do
systému přihlašujeme jako běžný uživatel. Pokud je potřeba spustit
příkaz v příkazovém řádku jako root, pak je po spuštění terminálové
emulace nutné spustit příkaz `su`, nejlépe s parametrem mínus („`-`"),
protože pak se provedou přihlašovací skripty uživatele root, čímž budou
nastaveny správně cesty k systémovým příkazům a nebude nutné zadávat
příkazy včetně nich (např. `/sbin/ifconfig` místo jednoduššího
`ifconfig`). Příkaz `su` vyžaduje před změnou identity uživatele zadat
heslo, na koho je změna prováděna (zde tedy uživatele root):

`$ `**`id`**\
`uid=500(huzva) gid=500(huzva) skupiny=500(huzva)`\
`$ `**`su`` ``-`**\
`Heslo: `\
`# `**`id`**\
`uid=0(root) gid=0(root) skupiny=0(root)`

Ve výše uvedeném příkladu je nejprve demonstrována pomocí příkazu `id`
identita uživatele (zde uživatel *huzva*). Po zadání příkazu `su -`
zadáno heslo uživatele root (nezobrazuje se). Po úspěšném zadání je
zapsán příkaz `id`, který ukazuje, že identita uživatele je skutečně
změněna.

Textový režim
-------------

Textový režim využívá základního režimu grafické karty, kdy je plocha
šachovnicově rozdělena na 80x25 (počet sloupců a řádků), přičemž v
každém políčku může být jeden znak. Do tohoto režimu je karta
automaticky přepnuta při startu počítače. V tomto režimu BIOS počítače
detekuje procesor, jeho frekvenci, kontroluje paměť, detekuje připojené
pevné disky a vypisuje vše na obrazovku. Některé základní desky jsou z
výroby nastaveny tak, že tyto textové informace jsou překryty obrázkem
(reklamou), avšak lze pomocí nějaké klávesy textový režim zobrazit
(obvykle klávesou TAB). Textový režim využíval například systém DOS.

Linux může s uživatelem komunikovat v textovém režimu pomocí příkazového
řádku. Tento režim se používá na serverech, aby se omezilo množství
nainstalovaných programů. Případně se používá ve chvíli, kdy je
například z důvodu chybné konfigurace nebo jiné chyby nemožné
nastartovat grafické uživatelské prostředí (viz výše). V textovém režimu
k dispozici obvykle 6 nezávislých virtuálních konzolí, mezi kterými je
možné se přepínat pomocí klávesové zkratky ALT+F1 až ALT+F6. Do přepnutí
mezi virtuálními konzolemi lze listovat v textu, který odroloval směrem
nahoru pomocí kláves SHIFT+PgUp a SHIFT+PgDn.

Zpět do grafické konzole se v případě, že je aktivních 6 textových
konzolí, přepneme kombinací kláves ALT+F7 (někdy ALT+F1 v závislosti na
tom, na jaké konzoli je grafické rozhraní spuštěno).

### KMS

Kernel Mode Setting (zkratka KMS)[^1][^2] je implementace řízení
grafické karty uvnitř jádra Linuxu. Pokud jádro rozpozná při svém startu
grafický čip, který umí ovládat (pomocí DRM),[^3] dojde k přepnutí do
nativního rozlišení. KMS umožňuje lepší spolupráci jádra a X
Serveru,[^4] který zajišťuje chod grafického uživatelského prostředí.
Též je spolehlivější usínání systému nebo jeho hibernace. Pokud je KMS
aktivní, používá se stále textový režim, ale ve stejném rozlišení, jako
má grafický režim. Výsledkem je obvykle větší počet sloupců a řádků
textového režimu. Vedlejším efektem může být jisté zpomalení výstupu
znaků v textovém režimu.

KMS lze vyřadit pomocí parametru jádra `nomodeset`. V současné době je
možné i v tomto režimu spustit grafické uživatelské rozhraní. X Server
si v takovém případě nastaví grafický režim karty sám (rozlišení,
barevná hloubka). V budoucnosti to však již nebude možné, protože X
Server přijde z bezpečnostních důvodů o oprávnění administrátora, které
k takovému úkolu potřebuje.

Výběr režimu při startu systému {#výběr_režimu_při_startu_systému}
-------------------------------

V Linux je možné před zavedením systému pomocí parametru sdělit, jaký
režim chceme spustit. Jednotlivým režimům (úrovním) říkáme runlevely.
Parametr je nejjednodušší předat jádru v menu programu Grub nebo LILO.
Seznam možných úrovní je v tabulkách.

Reference
---------

```{=html}
<references />
```
[Kategorie:Práce s Linuxem](Kategorie:Práce_s_Linuxem "wikilink")

[^1]: <http://en.wikipedia.org/wiki/Mode-setting> -- Mode-setting
    (obecně)

[^2]: <http://kerneltrap.org/node/8242> -- Linux: Kernel Graphics
    Subsystem

[^3]: <http://dri.freedesktop.org/wiki/DrmModesetting> -- DRI Wiki
    (Enhancing kernel graphics)

[^4]: <http://cs.wikipedia.org/wiki/X_Window_System#X_Server> -- X
    Window System a X server
