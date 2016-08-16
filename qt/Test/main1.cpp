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

#include "timer.h"

using namespace std;

// C read str
void test1(){
    char *p1;
    char s[80];

    do {
        p1 = s;
        gets(s);  /* read a string */
        /* print the decimal equivalent of each character */
        while(*p1) printf(" %d", *p1++);
    } while(strcmp(s, "done"));
}

// C arrays
void test2(){
    int x[4];
    int* p;
    p=x;

    x[0]=1;
    x[1]=5;

    *(p+2)=9;
    *(p+3)=13;

    for(int i=0;i<4;i++)
        printf("%d\n",x[i]);
}

// C chars
void test3(){
    char c=getchar();
    putchar(c);
}

int test4(){
    char c=getch();
    putch(c);
    putch('\n');
}

// use of timer.cpp
void test5(){
    struct my_time systime;

    systime.hours = 0;
    systime.minutes = 0;
    systime.seconds = 0;

    for(;;) {
        update(&systime);
        display(&systime);
    }
}

// C strings example
void test10(){
    char dic[3][5] = {
        {'w','o','r','d','\0'},{'s','u','n','\0'},{'t','o','\0'}
    };

    char dic1[3][5] = {
        'w','o','r','d','\0','s','u','n','\0','t','o','\0'
    };

    char dic2[][5] = {
        "word","sun","to"
    };

    char dic3[][2][80]={
        {"key1","value1"},
        {"key2","value2"},
        {"key3","value3"},
        {"key4","value4"},
        {"key5","value5"},
    };


    for(int i=0;i<3;i++)
        puts(dic[i]);

    putchar('\n');

    for(int i=0;i<3;i++)
        puts(dic1[i]);

    putchar('\n');

    for(int i=0;i<3;i++)
        puts(dic2[i]);

    putchar('\n');

    for(int i=0;i<5;i++){
        printf("%s: %s\n", dic3[i][0], dic3[i][1]);
    }
    putchar('\n');
    for(int i=0;i<5;i++){
        printf("%s: %s\n", &dic3[i][0][0], &dic3[i][1][0]);
    }
    putchar('\n');

    puts("Pointers to each string using first character");
    for(int i=0;i<5;i++){
        char *p0, *p1;

        p0=&dic3[i][0][0];
        p1=&dic3[i][1][0];

        printf("%s: %s\n", p0, p1);
    }
    putchar('\n');

    puts("Pointers to each string using array address");
    for(int i=0;i<5;i++){
        char *p0, *p1;

        p0=dic3[i][0];
        p1=dic3[i][1];

        printf("%s: %s\n", p0, p1);
    }
}

// show pointer
void test15(){
    int x=4;
    int* p=&x;
    printf("%p",p);
}

// shifts
void test17(){
    long l=1L;
    cout << l << endl;

    std::bitset<16> x(l);
    cout << x << endl;
}

// C IO
void test18(){
    int i;
    ofstream out("CHARS", ios::out | ios::binary);
    ofstream outText("CHARS.txt", ios::out);

    if(!out || !outText) {
        cout << "Cannot open output file.\n";
        return;
    }

    // write all characters to disk
    for(i=0; i<256; i++) out.put((char) i);
    for(i=0; i<256; i++) outText.put((char) i);

    out.close();
    outText.close();
}

void test19(){
    int x=EOF;
    cout<<"EOF: "<<x<<endl;
    cout<<"EOF Hex: "<<hex<<x;
}

// Qt hash map
const QHash<QString, int> getMap(){
    QHash<QString, int> hash;

    hash.insert("x",1);
    hash.insert("three",3);
    hash.insert("seven",7);

    return hash;
}

void test21(){
    QHash<QString, int> hash;
    hash=getMap();

    cout<<hash.value("x");

    QHash<QString, QVariant> map;

    map.insert("x","123");
    map.insert("three",3);

    QString s=map.value("x").toString();

    cout << s.toStdString();
}

// write json

class AJ{
public:
    AJ(int x){
        this->x=x;
    }

    void write(QJsonObject &json) const{
        json["x"]=x;
    }

    int x=5;

};

void test29(){
    QString s="asd";
    int x[]={3,4,2,3};

    QList<QString> list;
    list.append("123");
    list.append("qwe");

    QJsonArray a=QJsonArray::fromStringList(list);
    QJsonDocument doc(a);

    QByteArray jsonArray=doc.toJson();
    QString json(jsonArray);


    QList<AJ> list1;
    list1.append(AJ(8));
    list1.append(AJ(18));
    list1.append(AJ(1));

    QJsonArray ajArray;
    foreach (const AJ item, list1) {
        QJsonObject ajObject;
        item.write(ajObject);
        ajArray.append(ajObject);
    }

    QJsonDocument doc1(ajArray);

    QByteArray jsonArray1=doc1.toJson();
    QString json1(jsonArray1);

    qDebug() << json1;

    QString json2;
    json2=QString(jsonArray1);
    qDebug() << json2;
}

// Qt regex
void test32(){
    QString s="file2.png";
    QRegExp rx("\\.png$");
    int res=rx.indexIn(s);

    if(res!=-1)
        qDebug()<<"matches";
    else
        qDebug()<<"not-matches";

    QRegExp rx1("\\.([\\w]+)$");
    QString res1="nothing";
    if(rx1.indexIn(s)!=-1)
        res1=rx1.cap(1);

    qDebug() << res1;
}


int main(int argc, char *argv[])
{
    test();

    A a();

    putchar('\n');
    return 0;
}


