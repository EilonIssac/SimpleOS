from PySide6.QtCore import *
from PySide6.QtGui import * 
from PySide6.QtWidgets import *


class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        if not MainWindow.objectName():
            MainWindow.setObjectName(u"MainWindow")
        MainWindow.resize(400, 107)
        MainWindow.setWindowOpacity(0.770000000000000)
        MainWindow.setStyleSheet(u"")
        self.centralWidget = QWidget(MainWindow)
        self.centralWidget.setObjectName(u"centralWidget")
        self.tabWidget = QTabWidget(self.centralWidget)
        self.tabWidget.setObjectName(u"tabWidget")
        self.tabWidget.setGeometry(QRect(10, 10, 371, 271))
        self.tabWidget.setStyleSheet(u"")
        self.terminal_settings_tab = QWidget()
        self.terminal_settings_tab.setObjectName(u"terminal_settings_tab")
        self.label = QLabel(self.terminal_settings_tab)
        self.label.setObjectName(u"label")
        self.label.setGeometry(QRect(10, 10, 191, 17))
        self.checkBox_sal = QCheckBox(self.terminal_settings_tab)
        self.checkBox_sal.setObjectName(u"checkBox_sal")
        self.checkBox_sal.setGeometry(QRect(200, 8, 77, 23))
        self.checkBox_sal.setContextMenuPolicy(Qt.DefaultContextMenu)
        self.tabWidget.addTab(self.terminal_settings_tab, "")
        self.customize_tab = QWidget()
        self.customize_tab.setObjectName(u"customize_tab")
        self.customize_tab.setStyleSheet(u"")
        self.pushButton_cb = QPushButton(self.customize_tab)
        self.pushButton_cb.setObjectName(u"pushButton_cb")
        self.pushButton_cb.setGeometry(QRect(10, 10, 171, 25))
        self.pushButton_cb.setStyleSheet(u"QPushButton {\n"
"border: 0;\n"
"background-color: #e8e8e8;\n"
"}\n"
"\n"
"QPushButton:hover {\n"
"background-color: GainsBoro;\n"
"}")
        self.cb_frame = QFrame(self.customize_tab)
        self.cb_frame.setObjectName(u"cb_frame")
        self.cb_frame.setEnabled(False)
        self.cb_frame.setGeometry(QRect(190, 0, 171, 41))
        self.cb_frame.setStyleSheet(u"QFrame#cb_frame {\n"
"border: 0px;\n"
"}")
        self.cb_frame.setFrameShape(QFrame.StyledPanel)
        self.cb_frame.setFrameShadow(QFrame.Raised)
        self.comboBox_cb = QComboBox(self.cb_frame)
        self.comboBox_cb.addItem("")
        self.comboBox_cb.addItem("")
        self.comboBox_cb.addItem("")
        self.comboBox_cb.addItem("")
        self.comboBox_cb.addItem("")
        self.comboBox_cb.setObjectName(u"comboBox_cb")
        self.comboBox_cb.setGeometry(QRect(10, 10, 151, 25))
        self.tabWidget.addTab(self.customize_tab, "")
        self.timesettings_tab = QWidget()
        self.timesettings_tab.setObjectName(u"timesettings_tab")
        self.pushButton_ct = QPushButton(self.timesettings_tab)
        self.pushButton_ct.setObjectName(u"pushButton_ct")
        self.pushButton_ct.setGeometry(QRect(10, 10, 111, 25))
        self.pushButton_ct.setStyleSheet(u"QPushButton {\n"
"border: 0;\n"
"background-color: #e8e8e8;\n"
"}\n"
"\n"
"QPushButton:hover {\n"
"background-color: GainsBoro;\n"
"}")
        self.ct_frame = QFrame(self.timesettings_tab)
        self.ct_frame.setObjectName(u"ct_frame")
        self.ct_frame.setEnabled(False)
        self.ct_frame.setGeometry(QRect(130, -10, 221, 51))
        self.ct_frame.setStyleSheet(u"QFrame#ct_frame {\n"
"border: 0px;\n"
"}")
        self.ct_frame.setFrameShape(QFrame.StyledPanel)
        self.ct_frame.setFrameShadow(QFrame.Raised)
        self.comboBox_ct = QComboBox(self.ct_frame)
        self.comboBox_ct.setObjectName(u"comboBox_ct")
        self.comboBox_ct.setGeometry(QRect(10, 20, 161, 25))
        self.tabWidget.addTab(self.timesettings_tab, "")
        MainWindow.setCentralWidget(self.centralWidget)
        self.statusBar = QStatusBar(MainWindow)
        self.statusBar.setObjectName(u"statusBar")
        MainWindow.setStatusBar(self.statusBar)

        self.retranslateUi(MainWindow)

        self.tabWidget.setCurrentIndex(0)


        QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        MainWindow.setWindowTitle(QCoreApplication.translate("MainWindow", u"MainWindow", None))
        self.label.setText(QCoreApplication.translate("MainWindow", u"Show Arch Logo On Terminal Start:", None))
        self.checkBox_sal.setText("")
        self.tabWidget.setTabText(self.tabWidget.indexOf(self.terminal_settings_tab), QCoreApplication.translate("MainWindow", u"Terminal Settings", None))
        self.pushButton_cb.setText(QCoreApplication.translate("MainWindow", u"Change Desktop Background", None))
        self.comboBox_cb.setItemText(0, QCoreApplication.translate("MainWindow", u"Polygon", None))
        self.comboBox_cb.setItemText(1, QCoreApplication.translate("MainWindow", u"Nature", None))
        self.comboBox_cb.setItemText(2, QCoreApplication.translate("MainWindow", u"Technology", None))
        self.comboBox_cb.setItemText(3, QCoreApplication.translate("MainWindow", u"Space", None))
        self.comboBox_cb.setItemText(4, QCoreApplication.translate("MainWindow", u"Select From File", None))

        self.tabWidget.setTabText(self.tabWidget.indexOf(self.customize_tab), QCoreApplication.translate("MainWindow", u"Customize", None))
        self.pushButton_ct.setText(QCoreApplication.translate("MainWindow", u"Change Timezone", None))
        self.tabWidget.setTabText(self.tabWidget.indexOf(self.timesettings_tab), QCoreApplication.translate("MainWindow", u"Time Settings", None))

