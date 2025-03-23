# Zabbix agent2 - UserParameter
Repositories for teaching purposes at SPOS DK

Repository pro vyuku na SPOS DK

![Zabbix Appliance](../../Images/zabbix-agent2-UserParameter.png)

## Zabbix agent2 - UserParameter

- Konfigurace uživatelského itemu
- Podrobná [dokumentace](https://www.zabbix.com/documentation/current/en/manual/config/items/userparameters) na stránkách Zabbix.

### Konfigurace Zabbix agent2 skrze zabbix_agent2.d

- Přidejte direktivu UserParameter např. do souboru training.conf

```console
UserParameter=zbx.cmd.date[*],/bin/date +%$1 2>/dev/null
UserParameter=zbx.cmd.random,/usr/bin/awk 'BEGIN {srand();print int(1 + rand() * 100)}' 2>/dev/null

systemctl restart zabbix-agent2

tail -f /var/log/zabbix/zabbix_agent2.log
```

## Nastavte monitoring nahodného čísla :-)

- Vytvořte šablonu "Training"
- Vytvořte v ní nový Item s klíčem - zbx.cmd.random
- Nebo importujte již existující šablonu Training.yaml
- Nalinkujte šablonu n novému nebo existujícímu hostu

### Kontrola funkčnosti UserParameter monitoringu

- Nahlédněte do Latest Data na klíč zbx.cmd.random
...
