
# Dokumentace k Linuxu

Základem pro úspěšnou práci s Linuxem je dokumentace. Část najdete přímo v nainstalovaném systému, zbytek pak na Internetu nebo přímo ve zdrojových kódech (např. jako komentáře).

## Manuálové stránky

Nejstarší dokumentace je ve formě manuálových stránek. Ty jsou zapsány v souborech, které najdete v adresáři `/usr/share/man`. Zde naleznete podadresáře `man1` až `man9`, které obsahují jednotlivé manuálové stránky roztříděné do sekcí podle následujícího seznamu:

### Sekce manuálových stránek

1. uživatelské příkazy
2. služby jádra systému
3. knihovní funkce jazyka C
4. zařízení a ovladače zařízení
5. formáty souborů a protokoly (wtmp, /etc/passwd, nfs, ...)
6. triviální aplikační programy, hry
7. různé (např. nroff, ascii, utf-8, url, ...)
8. administrátorské příkazy, správa systému 

Překlady manuálových stránek jsou uloženy v adresářích, které odpovídají příslušné zkratce jazyka (české v adresáři `cs`, slovenské v adresáři `sk` a podobně). Překlady jsou dále děleny podle sekcí zmíněných výše.

## Zobrazení manuálových stránek

Manuálové stránky lze prohlížet několika způsoby. Prvním a nejstarším je příkaz `man`, který umožňuje manuálové stránky naformátovat příkazem `nroff` a zobrazit pomocí filtru `less`. Ve většině případů jsou manuálové stránky uloženy na disku v komprimovaném stavu, takže příkaz `man` je musí před formátováním ještě rozbalit (například nástrojem `gunzip`). Příkaz `man` provádí všechny potřebné mezikroky automaticky a pro zvětšení rychlosti zobrazení stránky si ukládá předformátované soubory do adresáře `/var/cache/man`.

Po zobrazení je manuálová stránka předána speciálnímu programu `less`, pomocí kterého můžete v textu listovat.

## Prohledávání manuálových stránek

K prohledávání manuálových stránek slouží příkaz `whatis` (zobrazí všechny manuálové stránky, které mají v názvu hledaný výraz) a `apropos`, který prohledává i stručné popisky manuálových stránek.

## Formát Info

Dokumentace ke GNU považuje manuálové stránky za zastaralé, a proto je k dispozici i formát _info_, který obsahuje možnosti tvorby hypertextových odkazů. 

## Další zdroje informací

Na Internetu pak naleznete spoustu dalších míst, které se věnují Linuxu.

- [Manuálové stránky na české Wikipedii](https://cs.wikipedia.org/wiki/Manuálové_stránky_(Unix))
- [Linux.cz](http://www.linux.cz)
- [Root.cz](http://www.root.cz)
- [AbcLinuxu.cz](http://www.abclinuxu.cz)
