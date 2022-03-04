# bombcrypto-superbot

## Basic usage

Run this command:



```bash
WALLET_ID=<INSERT-ID-HERE> TELEGRAM_KEY=<INSERT-API-KEY-HERE> yarn go
```

```TELEGRAM_KEY``` is optional

## Telegram Integration

If you want to receive information on telegram create a bot on BotFather: https://t.me/botfather#:~:text=BotFather%20is%20the%20one%20bot,BotFather%20right%20away

Available commands:

```/stats``` - Show heros working now

```/rewards``` - Show amount of bcoin

## Restart Bot on Errors

To make bot retry on errors, and never stop to work: 

* Install this tool: https://github.com/kadwanev/retry
* Edit ```bash_script.sh``` file with your IDs
* Add the code above to your ```~/.bashrc```

```retry -m $((5 * 60)) -x $((25 * 60)) 'sh $home/bombcrypto-superbot/bash_script.sh; false'```
