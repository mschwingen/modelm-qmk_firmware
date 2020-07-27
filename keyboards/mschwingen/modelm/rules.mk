# MCU name
MCU = atmega32u4

# Bootloader selection
#   Teensy       halfkay
#   Pro Micro    caterina
#   Atmel DFU    atmel-dfu
#   LUFA DFU     lufa-dfu
#   QMK DFU      qmk-dfu
#   ATmega32A    bootloadHID
#   ATmega328P   USBasp
BOOTLOADER = qmk-dfu

# Build Options
#   change yes to no to disable
#
BOOTMAGIC_ENABLE = no       # Virtual DIP switch configuration
MOUSEKEY_ENABLE = yes       # Mouse keys
EXTRAKEY_ENABLE = yes       # Audio control and System control

CONSOLE_ENABLE = yes         # Console for debug

COMMAND_ENABLE = yes         # Commands for debug and configuration
# Do not enable SLEEP_LED_ENABLE. it uses the same timer as BACKLIGHT_ENABLE
SLEEP_LED_ENABLE = no       # Breathing sleep LED during USB suspend
# if this doesn't work, see here: https://github.com/tmk/tmk_keyboard/wiki/FAQ#nkro-doesnt-work
NKRO_ENABLE = no            # USB Nkey Rollover
BACKLIGHT_ENABLE = no       # Enable keyboard backlight functionality on B7 by default
RGBLIGHT_ENABLE = no        # Enable keyboard RGB underglow
MIDI_ENABLE = no            # MIDI support
UNICODE_ENABLE = no         # Unicode
BLUETOOTH_ENABLE = no       # Enable Bluetooth with the Adafruit EZ-Key HID
AUDIO_ENABLE = no           # Audio output
FAUXCLICKY_ENABLE = no      # Use buzzer to emulate clicky switches
HD44780_ENABLE = no         # Enable support for HD44780 based LCDs

CUSTOM_MATRIX = lite
KEY_LOCK_ENABLE = yes

DYNAMIC_MACRO_ENABLE = yes

# select one of "ffc", "wired" or "ws2812".
#KBLEDS_VARIANT = ws2812
#KBLEDS_VARIANT = wired
KBLEDS_VARIANT = ffc

UART_DEBUG = no

SRC += matrix.c
SRC +=	$(COMMON_DIR)/uart.c

OPT_DEFS += -DSLEEP_LED_ENABLE # we need our own sleep callbacks to turn of WS2812 LEDs

ifeq ($(strip $(KBLEDS_VARIANT)), ws2812)
    SRC += ws2812.c
    OPT_DEFS += -DMODELM_LEDS_WS2812
endif
ifeq ($(strip $(KBLEDS_VARIANT)), ffc)
    OPT_DEFS += -DMODELM_LEDS_FFC
endif
ifeq ($(strip $(KBLEDS_VARIANT)), wired)
    OPT_DEFS += -DMODELM_LEDS_WIRED
endif

ifeq ($(strip $(UART_DEBUG)), yes)
    OPT_DEFS += -DUART_DEBUG
endif

LINK_TIME_OPTIMIZATION_ENABLE = yes
