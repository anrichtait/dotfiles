#! python3
import pyperclip


def add_bullets(string):
    stringList = string.split('\n')
    print(f"Unformatted: {stringList}")
    for line in range(len(stringList)):
        stringList[line] = '- ' + stringList[line]
    string = '\n'.join(stringList)
    print(f"Formatted: {string}")


text = pyperclip.paste()
add_bullets(text)
pyperclip.copy(text)
