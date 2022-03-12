> :warning: **There are risks when using any kind of unofficial software**: Be very careful! If you lose your account, it is entirely your responsibility.
# Bombcrypto-superbot

This bot is a product of reverse engineering Bombcrypto game. It simulates the game and send messages using `websocket`. Since it does not require a browser to work, the main usage is for **multi-account**. Have fun!

## Features

It does the following:
- Automatic farming on Treasure Hunt
- Automatic Adventure mode (see usage section)
- Handles Home feature if a house is available

## Installation

You need the following packages installed for this bot to work:

- https://git-scm.com/downloads
- https://nodejs.org/en/download/ Version **16** at least.

Open bash on a folder you want the project to be cloned. Windows users (*shame*) can open **Git Bash** right-clicking on the Desktop folder or any other folder.

With a bash window open:

```bash
npm install -g yarn
git clone https://github.com/john-titor-master/bombcrypto-superbot
cd bombcrypto-superbot
yarn install
```

Whenever the project updates, you can update your local files through `git`. Open a bash terminal on the project folder (right-click **Git Bash** inside the project folder for Windows users):

```bash
git pull
```

This command may fail if you have changed some of the files locally. If you did that, I assume you know how to use `git`. If you do not, https://git-scm.com/book.

## Usage

Open a bash terminal on the project folder, run the following command:

```bash
WALLET_ID=wallet_id TELEGRAM_KEY=telegram_key ADVENTURE=adventure yarn go
```

The envirement variables are explained below:
- `WALLET_ID` (**required**): The identifier of the wallet you want the bot to run with.
- `TELEGRAM_KEY` (optional): The key of a telegram bot. See Telegram integration section.
- `ADVENTURE` (optional) (must be either 0 or 1): This indicates if you want the bot to play adventure mode by itself. The default value is `0` (false), meaning it will not use your keys. If you want the bot to play the adventure mode for you, you can pass `1` (true) to this variable.

## Telegram integration

If you want to see the progress of the bot on your phone, you may create a telegram bot through BotFather (https://t.me/botfather). With the created key, pass the `TELEGRAM_KEY` enviroment variable when initializing the bot.

Start a conversation with the created bot and send the following:
- `/stats`: Brings information about the current map life, the amount of working heroes and the current hero selection identifier.
- `/rewards`: Brings the current amount of coins, heroes to be claimed and keys you have in your account.
- `/exit`: Will kill the bot.

## Resilience and multi-account

If you want the bot to never stop running for any exception (sometime the server of the games fails and you gave a **PromiseTimeout** exceptio), you can build the project using Docker.

Install Docker: https://docs.docker.com/desktop/

Open a bash terminal on the project folder:

```bash
docker build . -t bsb
```

> This should be done whenever the projects gets updated.

Now, create a `.env` file with the enviroment variables from the initialization, like:

```
WALLET_ID=
TELEGRAM_KEY=
ADVENTURE=
```

Fill the values after the `=` (equal) sign. Leave `TELEGRAM_KEY` and `ADVENTURE` empty if you do not need them.

To run the bot in **interactive mode**:

```bash
docker run --env-file=.env --name bsb1 -it bsb
```

In interactive mode, you will see the logs just as usual. But you may want it to keep running if something fails, you must run it in **detached mode** then:

```bash
docker run --env-file=.env --restart=always --name bsb1 -dt bsb
```

The `--restart=always` option will restart the bot if some error occurs. No output will be seen on this approach. if you want to see the logs:

```bash
docker logs bsb1 --tail 200 -f
```

The option `--tail 200` will show the last 200 lines of output, the `-f` option will follow the logs as they are shown. To stop logging press the `CANCEL` command, on most cases press `CTRL+C` on the terminal window.

To list running bots (docker containers):

```bash
docker ps
```

To remove the running bot:

```bash
docker rm bsb1 -f
```

You may create as many `.env` files as you need. For each account you run using Docker, give a different name when running the `docker run` command. For each bot, you need a **different** telegram key to communicate with them. All commands listed here a simple Docker commands, I highly recommend studying them at the official documentation and learn how it works.


## Restart Bot on Errors Without Docker

To make bot retry on errors, and never stop to work: 

* Install this tool: https://github.com/kadwanev/retry
* Edit ```bash_script.sh``` file with your IDs
* Make file executable ```chmod +x bash_script.sh```
* Add the code above to your ```~/.bashrc```

```retry -m $((5 * 60)) -x $((25 * 60)) 'sh $HOME/bombcrypto-superbot/bash_script.sh; false'```

If you need to detach this command, run:

```nohup retry -m $((5 * 60)) -x $((25 * 60)) 'sh $HOME/bombcrypto-superbot/bash_script.sh; false' &```
