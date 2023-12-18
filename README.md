# RC2014 tinkering

## Requirements

- Assemble your [RC2014](https://rc2014.co.uk/)
- [Install Nix](https://nix.dev/install-nix)

  Enter the Nix shell with

  ```console
  nix-shell --run $SHELL
  ```

  or set up [`direnv`](https://github.com/nix-community/nix-direnv) and call

  ```console
  direnv allow
  ```

## Getting started

Plug in the FTDI (serial adapter) into your USB port and `/dev/ttyACM0` should appear.

Power off the RC2014. Then connect to the serial port:

```console
$ sudo tio /dev/ttyACM0
[20:27:46.419] tio v2.5
[20:27:46.419] Press ctrl-t q to quit
[20:27:46.420] Connected
```

Power on the RC2014, and press the reset button.

It will boot from the ROM as set by the [page selection jumpers](https://rc2014.co.uk/?s=rom+labels).

Follow the instructions on the terminal to do things.

## Burning ROMs

Connect a [TL866II plus](http://autoelectric.cn/EN/TL866_main.html) to your USB port and run `xgpro` to start the Wine application.
