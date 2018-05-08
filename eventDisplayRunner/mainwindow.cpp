#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QString>
#include <QFileDialog>
#include <QProcess>
#include <QDebug>
#include <QMessageBox>
#include "globals.h"
#include <QKeyEvent>
//#include <dialog>
//#include <ui_dialog>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->menuBar->hide();

//    QString myPath;
//    myPath=ui->lineEdit_2->text();
//      qDebug() << g_some_string << MAGIC_NUM << myPath;

//    connect(ui->pushButton_5, SIGNAL(clicked(bool)), SLOT(runBashScript("David")));
  //  connect(ui->radioButton, SIGNAL(clicked(bool)),SLOT()

}

MainWindow::~MainWindow()
{
    delete ui;
}


//RUN GUI
void MainWindow::on_pushButton_3_clicked()
{

    // Get this file name dynamically with an input GUI element, like QFileDialog
    // or hard code the string here.

//    QString fileName = QFileDialog::getOpenFileName(this,
 //   tr("Open Script"), "/", tr("Script Files (*.sh)"));

    QString fileName = "../scripts/runGUI.sh";

    // Uniform initialization requires C++11 support, so you would need to put
    // this into your project file: CONFIG+=c+11
    if (!QProcess::startDetached("/bin/sh", QStringList{fileName}))
        qDebug() << "Failed to run";

}


//Close GUI
void MainWindow::on_pushButton_4_clicked()
{
    QString fileName = "../scripts/killGUI.sh";

    // Uniform initialization requires C++11 support, so you would need to put
    // this into your project file: CONFIG+=c+11
    if (!QProcess::startDetached("/bin/sh", QStringList{fileName}))
        qDebug() << "Failed to run";

}


//RUN Marlin
void MainWindow::on_pushButton_2_clicked()
{

  //  QString fileName = "../scripts/startMarlin.sh";

        // Uniform initialization requires C++11 support, so you would need to put
        // this into your project file: CONFIG+=c+11

    //if (QProcess::execute(QString("/bin/sh") + fileName) < 0)
    //    qDebug() << "Failed to run";


    QProcess *process = new QProcess;
    process->startDetached("../scripts/runMarlin.sh");
    // process->start("Marlin ../eventDisplay.xml");
    process->waitForFinished();
     qDebug () << process->readAllStandardOutput();
}




//    QProcess *process = new QProcess;
//    process->startDetached("./test.sh", QStringList() << "abc" << mytext);
//    process->waitForFinished();
//    qDebug () << process->readAllStandardOutput();





void MainWindow::on_radioButton_clicked()
{
    ui->label->setText("Last RUN");
}


void MainWindow::on_radioButton_2_clicked()
{
    ui->label->setText("Select from list");
}

void MainWindow::on_radioButton_3_clicked()
{
    ui->label->setText("Particular run");
}



void MainWindow::on_pushButton_5_clicked()
{
    QString myrun;
    QString arg;
    QString minHits;
    bool checked=false;

    //Select Last run
    if(ui->radioButton->isChecked()) {
        arg = "0";
        checked=true;
    }

    //Select run from list
    if(ui->radioButton_2->isChecked()) {
        arg = "1";
        myrun = "";
        checked=true;
    }

    //Enter particular run
    if(ui->radioButton_3->isChecked()) {
        arg = "2";
        myrun = ui->lineEdit->text();
        checked=true;
    }


    //Check if any of run options is selected
    if(!checked) {
        QMessageBox::critical(this, "Configuration failed!", "Please select a option for run number!!!");
    }
    else {

        if(arg=="2" && myrun=="") {
          QMessageBox::critical(this, "ERROR!", "Enter run number!!!");
          return;
        }

        if(arg=="1") {
            QMessageBox::warning(this, "Warning", "Run selection option is not yet implemented!!!");
            return;
        }


        minHits=ui->lineEdit_3->text();
        if(minHits=="") {
            minHits="0";
        }

        //qDebug()<<myrun;
        // RUN bash script with arguments here
        QProcess *process = new QProcess;
        process->startDetached("../scripts/findRun.sh", QStringList() << arg << myrun << minHits);
        process->waitForFinished();

        qDebug () << process->readAllStandardOutput();

    }
}




void MainWindow::on_pushButton_7_clicked()
{
    QProcess *process = new QProcess;
    process->startDetached("../scripts/capture.sh");
    process->waitForFinished();
}
