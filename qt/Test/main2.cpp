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

using namespace std;

void writeFile(QString path, QString text) {
  QFile file(path);

  if (!file.open(QIODevice::WriteOnly | QIODevice::Text)) {
    qWarning("Couldn't open file.");
    return;
  }

  file.write(text.toStdString().c_str());
}

// write file
void test1(){
  QString path="export/out.txt";
  QString text="text\nmusic\nvideo\nmusic\n";

  writeFile(path, text);
}

// format time
void test3(){
  int time=14239;
  QString format="Time: %.2f s ";

  float resTime=(float)time / 1000;

  QString res;
  res.sprintf(qPrintable(format), resTime);

  qDebug() << res;
}

// sqlite examples
void insertData(){
  QSqlQuery qry;
  
  qry.prepare( "CREATE TABLE IF NOT EXISTS names (id INTEGER UNIQUE PRIMARY KEY, firstname VARCHAR(30), lastname VARCHAR(30))" );
  if( !qry.exec() )
    qDebug() << qry.lastError();
  else
    qDebug() << "Table created!";

  qry.prepare( "INSERT INTO names (id, firstname, lastname) VALUES (1, 'John', 'Doe')" );
  if( !qry.exec() )
    qDebug() << qry.lastError();
  else
    qDebug( "Inserted!" );
  
  qry.prepare( "INSERT INTO names (id, firstname, lastname) VALUES (2, 'Jane', 'Doe')" );
  if( !qry.exec() )
    qDebug() << qry.lastError();
  else
    qDebug( "Inserted!" );

  qry.prepare( "INSERT INTO names (id, firstname, lastname) VALUES (3, 'James', 'Doe')" );
  if( !qry.exec() )
    qDebug() << qry.lastError();
  else
    qDebug( "Inserted!" );

  qry.prepare( "INSERT INTO names (id, firstname, lastname) VALUES (4, 'Judy', 'Doe')" );
  if( !qry.exec() )
    qDebug() << qry.lastError();
  else
    qDebug( "Inserted!" );

  qry.prepare( "INSERT INTO names (id, firstname, lastname) VALUES (5, 'Richard', 'Roe')" );
  if( !qry.exec() )
    qDebug() << qry.lastError();
  else
    qDebug( "Inserted!" );
}

// sqlite connection and select
void test4(){
  QSqlDatabase db = QSqlDatabase::addDatabase( "QSQLITE" );
  db.setDatabaseName( "test.db" );

  if( !db.open() )
  {
    qDebug() << db.lastError();
    qFatal( "Failed to connect." );
  }
  qDebug( "Connected!" );

  QSqlQuery qry;
  insertData();

  qry.prepare( "SELECT * FROM names" );
  if( !qry.exec() )
    qDebug() << qry.lastError();
  else
  {
    qDebug( "Selected!" );
    QSqlRecord rec = qry.record();
    int cols = rec.count();

    for( int c=0; c<cols; c++ )
      qDebug() << QString( "Column %1: %2" ).arg( c ).arg( rec.fieldName(c) );

    for( int r=0; qry.next(); r++ )
      for( int c=0; c<cols; c++ )
        qDebug() << QString( "Row %1, %2: %3" ).arg( r ).arg( rec.fieldName(c) ).arg( qry.value(c).toString() );
  }

  db.close();
}

// sqlite connect
void createConnection(QString dbname){
  QSqlDatabase db = QSqlDatabase::addDatabase( "QSQLITE" );
  db.setDatabaseName( dbname );

  if( !db.open() )
  {
    qDebug() << db.lastError();
    qFatal( "Failed to connect." );
  }
  qDebug( "Connected!" );
}

// sqlite create table
void createTable(){
  QSqlQuery query;

  query.prepare( "CREATE TABLE IF NOT EXISTS names7 ( \
                 id INTEGER UNIQUE PRIMARY KEY AUTOINCREMENT, \
                 name VARCHAR(200) UNIQUE DEFAULT NULL, \
                 value LONGTEXT \
                 )" );

      if( !query.exec() )
      qDebug() << query.lastError();
  else
  qDebug() << "Table created!";
}

// run sqlite test
void test5(){
  createConnection("test.db");
  createTable();
}

// get count from table
void test6(){
  createConnection("config.db");
  QSqlQuery query;
  QString sql;
  
  QString table="config";
  sql = "select count(*) from " + table + " where name=:name";
  
  query.prepare( sql );
  query.bindValue(":name", "lastA");
  
  if( !query.exec() )
    qDebug() << "Select error: " << query.lastError();
  else
  {
    query.next();
    int res=query.value(0).toInt();
    qDebug() << "Count: " << res;
  }
}

// get json value from table and parse
void test7(){
  createConnection("config.db");
  QSqlQuery query;
  QString sql;

  QString table="config";
  sql = "select value from " + table + " where name=:name";

  query.prepare( sql );
  query.bindValue(":name", "last");

  if( !query.exec() ){
    qDebug() << "Select error: " << query.lastError();
    return;
  }

  query.next();
  QString json=query.value(0).toString();
  //  qDebug() << "JSON: " << json;

  QByteArray byteArray(qPrintable(json));
  QJsonDocument doc(QJsonDocument::fromJson(byteArray));
  QJsonArray fields=doc.array();

  foreach (QJsonValue val, fields) {
    QJsonObject item=val.toObject();
    QString key=item.keys()[0];
    QString value=item[key].toString();

    qDebug() << "key: " << key;
    qDebug() << "value: " << value;
    qDebug();
  }
}

// list test
void test9(){
  QList<QString> list;

  list.append("qwe");
  list.append("asd");
  list.append("zxc");

  fun(list);

  foreach(QString val, list)
    qDebug() << val;
}

// inheritance examples
// dynamic_cast<>
class TreeNode{
public:
  QString text;
  virtual void f() {}
};

class DirNode : public TreeNode{
public:
  QString children;
};

class FileNode : public TreeNode{
public:
  int size;
};

void test11(){
  TreeNode* t;

  DirNode *dir=new DirNode();
  dir->text="folder1";
  dir->children="folder1::children";

  FileNode *file=new FileNode();
  file->text="file1.txt";
  file->size=5663;

  QList<TreeNode*> list;
  list.append(dir);
  list.append(file);

  DirNode d1;
  t=&d1;

  foreach(TreeNode* item, list){
    qDebug() << "Text: " << item->text;

    DirNode *d=dynamic_cast<DirNode*>(item);
    if(d){
      qDebug() << "Children: " << d->children;
    }

    if(!d){
      qDebug("No Dir");
    }

    FileNode *f=dynamic_cast<FileNode*>(item);
    if(f){
      qDebug() << "Size: " << f->size;
    }
  }
}

// NULL test
void test14(){
  A2 *a2=NULL;
  if(a2==NULL)
    qDebug() << "null";
  else
    qDebug() << "not null";
}


int main(int argc, char *argv[])
{
  test();

  putchar('\n');
  return 0;
}

