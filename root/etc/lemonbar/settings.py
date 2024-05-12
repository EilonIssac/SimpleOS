import sys
from PySide6 import QtGui
from PySide6.QtWidgets import QApplication, QMainWindow, QFileDialog
from PySide6.QtCore import *
from ui_mainwindow import Ui_MainWindow
import subprocess
import time

ct_donotchange = 0

class MainWindow(QMainWindow):
    def __init__(self):

        def update_sal(state):
            if state < 1:
                print("Disabling Arch Logo On Terminal Start")
                subprocess.run("sed -i '/neofetch -L/d' /home/$(logname)/.bashrc", shell=True)
            elif state > 1:
                print("Enabling Arch Logo On Terminal Start")
                subprocess.run("sed -i '/#sal/a neofetch -L' /home/$(logname)/.bashrc", shell=True)

        def show_cb_frame():
            self.ui.cb_frame.setEnabled(True)
            self.ui.cb_frame.show()

        def show_ct_frame():
            self.ui.ct_frame.setEnabled(True)
            self.ui.ct_frame.show()

        def hide_cb_frame():
            self.ui.cb_frame.setEnabled(False)
            self.ui.cb_frame.hide()

        def hide_ct_frame():
            self.ui.ct_frame.setEnabled(True)
            self.ui.ct_frame.hide()

        def change_background(background):
            if background == "Select From File":
                filename, ok = QFileDialog.getOpenFileName(
                    self,
                    "Select a File",
                     "/etc/feh-bg",
                     "Images (*.png *.jpg)"
                )
                if filename:
                    subprocess.run("feh --bg-scale " + filename, shell=True)
                    subprocess.run('echo "' + filename + '" > /etc/feh-bg/current', shell=True)
                    subprocess.run('echo "Select From File" >> /etc/feh-bg/current', shell=True)
            else:
                subprocess.run("feh --bg-scale /etc/feh-bg/" + background.lower() + ".jpg", shell=True)
                subprocess.run('echo "/etc/feh-bg/' + background.lower() + '.jpg" > /etc/feh-bg/current', shell=True)
                subprocess.run('echo "' + background + '" >> /etc/feh-bg/current', shell=True)
            hide_cb_frame()

        def display_timezones():
            global ct_donotchange
            ct_donotchange = 1
            timezones = subprocess.check_output("timedatectl list-timezones", shell=True).decode('ascii')[:-1]
            x = 0
            for timezone in timezones.split("\n"):
                self.ui.comboBox_ct.addItem("")
                self.ui.comboBox_ct.setItemText(x, timezone)
                x += 1
            current_timezone = subprocess.check_output("timedatectl show | grep Timezone | awk -F '=' '{ print $2 }'", shell=True).decode('ascii')[:-1]
            self.ui.comboBox_ct.setCurrentText(current_timezone)
            show_ct_frame()
            ct_donotchange = 0

        def change_timezone(timezone):
            if ct_donotchange == 0:
                subprocess.run("timedatectl set-timezone " + timezone, shell=True)
                hide_ct_frame()

        super(MainWindow, self).__init__()
        self.ui = Ui_MainWindow()
        self.ui.setupUi(self)
        self.ui.checkBox_sal.setChecked(True)

        try:
            sal_state = subprocess.check_output("cat /home/$(logname)/.bashrc | grep 'neofetch -L'", shell=True).decode('ascii')[:-1]
        except subprocess.CalledProcessError:
            sal_state = ""

        if sal_state != "":
            self.ui.checkBox_sal.setChecked(True)
        elif sal_state == "":
            self.ui.checkBox_sal.setChecked(False)

        try:
            comboBox_cb_state = subprocess.check_output("cat /etc/feh-bg/current | tail -n 1", shell=True).decode('ascii')[:-1]
        except subprocess.CalledProcessError:
            comboBox_cb_state = ""

        self.ui.comboBox_cb.setCurrentText(comboBox_cb_state)

        hide_cb_frame()
        hide_ct_frame()

        self.ui.checkBox_sal.stateChanged.connect(update_sal)
        self.ui.pushButton_cb.clicked.connect(show_cb_frame)
        self.ui.pushButton_ct.clicked.connect(display_timezones)
        self.ui.comboBox_ct.currentTextChanged.connect(change_timezone)
        self.ui.comboBox_cb.currentTextChanged.connect(change_background)

if __name__ == "__main__":
    app = QApplication(sys.argv)

    window = MainWindow()
    window.show()

    sys.exit(app.exec())
