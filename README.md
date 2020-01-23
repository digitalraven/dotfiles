Dotfiles
========

After cloning this repo, run `install` to set up the user environment. The install script is idempotent --- running it multiple times has no effect.

Dotfiles uses [Dotbot][0] and [Dotbot-Pip][1] for installation.

Bootstrapping
-------------

The intent of this repo is to bring a new macOS account to a 'standard' state. It's entirley suited to my personal preference<sup>[1](#fn1)</sup>. Effectively, it's a barebones bootstrapping system for machines that aren't part of a larger configuration management infrastructure.

1. Ensure you have git available.

    ```sh
    xcode-select --install
    ```

2. Install [Homebrew][2] --- sensible installation requires reading the installation script to make sure it's not been tampered with, rather than just executing an arbitrary ruby script pulled via `curl`. Even non-sensible installation requires `sudo`; as such I'd much rather this happen as a separate step.

2. Clone this repo

    ```sh
    git clone https://github.com/digitalraven/dotfiles
    ```

3. Sign in to the App Store; `mas` is flaky on Catalina, and doesn't work with command-line signin. Signing in via the app is a workaround that makes it kinda-work-ish. Sometimes.

3. Install

    ```sh
    cd dotfiles && ./install
    ```

4. Go for any or all of a cigarette, a gin and tonic, or a hot beverage of your choice. The brewfile pulls down a lot of casks, so you might as well do something useful with your time.

Included Configuration
----------------------

* Commands, packages, and software from the App Store are managed using [Homebrew][2]. This is all controlled using a `brewfile`, a list of packages to install. Read that file to find out what's being installed.
* `vim` configuration and plugins are installed directly, and managed via [Pathogen][3].
* Standard git configuration and system wide ignore come from `gitconfig` and `gitignore`.
* Shell customisation is done via [`oh-my-zsh`][4], with a custom set of aliases and functions. Most plugins are in the `brewfile`, but `zsh-apple-touchbar` is brought down in the `pre-install.sh` as it uses a feature branch not included in the main repo.
* Python modules not in homebrew are installed using [Dotbot-Pip][1], from a list in `packages.pip`

Third-Party Licences
--------------------

Some installed software will require purchase of a licence for full functionality. This includes (but is not limited to):

* BetterTouchTool
* Hyperdock
* iStat Menus
* Kaleidoscope
* LastPass
* Microsoft Office
* Paste
* Scrivener
* Scapple

Finding where to purchase a licence and making that purchase is left as an exercise for the user.



<a name="fn1">1</a>: One of my personal preferences includes getting a computer to do a lot of boring, repetitive tasks<sup>[2](#fn2)</sup> --- such as installing software and managing configuration files. If I had to try to remember which packages to install every time, each machine I use would be in a completely different state.
<a name="fn2">2</a>: Configuration management is a topic close to my heart, but often I end up with machines that can't (for political rather than technological reasons) be enrolled in a proper CM environment. I will happily talk about the need for suitable CM for days at a time if given appropriate conversational lubricant (beer, gin, or whisky).

[0]: https://github.com/anishathalye/dotbot
[1]: https://github.com/sobolevn/dotbot-pip
[2]: https://brew.sh
[3]: https://github.com/tpope/pathogen
[4]: https://ohmyz.sh
