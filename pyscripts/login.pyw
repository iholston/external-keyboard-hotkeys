import sys, time, pyautogui, os
from tkinter import messagebox
# autohotkey passes directory as 2 separate arguments
# since i have blah\Isaac Holston\blah\moreblah.txt 
loginPath = sys.argv[1] + " " + sys.argv[2] 
loginNum = int(sys.argv[3])
file = open(loginPath)
for i in range(1, 10):
    if i == (loginNum * 2) - 1:
        username = file.readline()
        password = file.readline()
        break
    file.readline()
time.sleep(1.5)
pyautogui.press('tab')
time.sleep(.5)
pyautogui.typewrite(username.split()[2])
time.sleep(.5)
pyautogui.press('tab')
time.sleep(.5)
pyautogui.typewrite(password.split()[2])
time.sleep(.5)
pyautogui.press('enter')
