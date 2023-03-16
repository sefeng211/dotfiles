import subprocess
from pynput import keyboard


last_key = None

def on_press(key):
    global last_key
    try:
        if last_key is not None and key.char == "k" and last_key.char == "j":
            subprocess.call(["trigger_fcitx"])
            print("do work")
        last_key = key
        print('alphanumeric key {0} pressed'.format(
            key.char))
    except AttributeError:
        print('special key {0} pressed'.format(
            key))


with keyboard.Listener(
        on_press=on_press,
        ) as listener:
    listener.join()
