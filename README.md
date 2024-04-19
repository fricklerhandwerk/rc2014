# RC2014 tinkering

## Requirements

- Assemble your [RC2014](https://rc2014.co.uk/)
- [Install Nix](https://nix.dev/install-nix)

  Enter the Nix shell with

  ```console
  nix-shell https://github.com/fricklerhandwerk/rc2014/tarball/master --run $SHELL
  ```

  This will take a while, add `-v` to observe what happens.

  Alternatively, clone this repository, set up [`direnv`](https://github.com/nix-community/nix-direnv) and call

  ```console
  git clone https://github.com/fricklerhandwerk
  cd rc2014
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

Connect a [XGecu Pro TL866II plus](http://autoelectric.cn/EN/TL866_main.html) to your USB port and run `xgpro` to start the Wine application.

- Press `Select IC` (top left), a window opens.
- Select `ATMEL` in the center column.
- Select`AT28C64B` in the right column.

In the button bar at the top:
- Press `READ` to read ROM contents.
- Press `LOAD` to load a ROM file.
- Press `PROG.` to write the loaded file to the ROM.
