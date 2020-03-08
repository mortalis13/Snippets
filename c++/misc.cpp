
#include <iostream>
#include <fstream>

using namespace std;

// ----------------------------------------------------

void writeToFile(string filename, string text) {
  fstream f;
  f.open(filename, ios::out | ios::app);
  if (f.is_open()) {
    cout << "File opened" << endl;
    f << text << endl;
    f.close();
  }
  else {
    cout << "Error opening file" << endl;
  }
}

string readFile(string filename) {
  string result = "";
  
  fstream f(filename, ios::in);
  if (f.is_open()) {
    cout << "File opened" << endl;
    
    size_t size = 100;
    char buf[size];
    while (!f.eof()) {
      f.read(buf, size);
      size_t dataSize = f.gcount();
      string tmp(buf, dataSize);
      result += tmp;
    }
    
    f.close();
  }
  else {
    cout << "Error opening file" << endl;
  }
  
  return result;
}

string readFile_v2(string filename) {
  string result = "";
  
  fstream f(filename, ios::in | ios::ate);
  if (f.is_open()) {
    cout << "File opened" << endl;
    
    size_t size = f.tellg();
    char buf[size];
    f.seekg(0, ios::beg);
    f.read(buf, size);
    f.close();
    result = string(buf, size);
  }
  else {
    cout << "Error opening file" << endl;
  }
  
  return result;
}

