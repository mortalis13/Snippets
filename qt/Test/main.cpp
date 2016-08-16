#include <QCoreApplication>
#include <iostream>
#include <stdio.h>
#include <conio.h>
#include <bitset>
#include <fstream>
#include <QMap>
#include <QHash>
#include <QVariant>
#include <QtDebug>
#include <QJsonObject>
#include <QJsonArray>
#include <QJsonDocument>
#include <QFile>
#include <QThread>
#include <QObject>
#include <QtSql>
#include <QColor>


using namespace std;


// color convertions
void q2(){
  QColor c1=QColor::fromHsv(101,201,198);

  qDebug() << QString("hsv: %1, %2, %3").arg(c1.hue()).arg(c1.saturation()).arg(c1.value());
  qDebug() << QString("rgb: %1, %2, %3").arg(c1.red()).arg(c1.green()).arg(c1.blue());
  qDebug();


  QColor c2=QColor::fromRgb(90,198,42);

  qDebug() << QString("hsv: %1, %2, %3").arg(c2.hue()).arg(c2.saturation()).arg(c2.value());
  qDebug() << QString("rgb: %1, %2, %3").arg(c2.red()).arg(c2.green()).arg(c2.blue());
  qDebug();


  QColor c3=QColor::fromRgb(91,198,42);

  qDebug() << QString("hsv: %1, %2, %3").arg(c3.hue()).arg(c3.saturation()).arg(c3.value());
  qDebug() << QString("rgb: %1, %2, %3").arg(c3.red()).arg(c3.green()).arg(c3.blue());
  qDebug();


  QColor c4=QColor::fromRgb(89,198,42);

  qDebug() << QString("hsv: %1, %2, %3").arg(c4.hue()).arg(c4.saturation()).arg(c4.value());
  qDebug() << QString("rgb: %1, %2, %3").arg(c4.red()).arg(c4.green()).arg(c4.blue());
  qDebug();
}


int main(int argc, char *argv[])
{
  q();

  putchar('\n');
  return 0;
}

