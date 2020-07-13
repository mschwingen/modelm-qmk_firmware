# atmega32U4 board for IBM Model M

![modelm](https://raw.githubusercontent.com/mschwingen/hardware/master/modelm-usb/images/PCB.jpg)

This is a configuration of QMK intended to be used with the [Model M USB PCB](https://github.com/mschwingen/hardware/tree/master/modelm-usb).

* Keyboard Maintainer: [Michael Schwingen](https://github.com/mschwingen/)
* Hardware Supported: [Model M USB PCB](https://github.com/mschwingen/hardware/tree/master/modelm-usb)
* Hardware Availability: need to build your own.

Make example for this keyboard (after setting up your build environment):

    make mschwingen/modelm:default

flash:

    make mschwingen/modelm:default:dfu

See the [build environment setup](https://docs.qmk.fm/#/getting_started_build_tools) and the [make instructions](https://docs.qmk.fm/#/getting_started_make_guide) for more information. Brand new to QMK? Start with our [Complete Newbs Guide](https://docs.qmk.fm/#/newbs).

bootloader:
	do not use the QMK bootloader, use the bootloader from [here](https://github.com/mschwingen/modelm-lufa-bootloader)

Program bootloader via ISP:
	avrdude -p atmega32u4 -c avrispmkii -P usb -U flash:w:mschwingen_modelm_default_bootloader.hex:a
