
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


string str_format(const char* fmt, ...) {
  string result;
  
  va_list vl;
  va_start(vl, fmt);
  int size = _vscprintf(fmt, vl);
  result.resize(++size);
  vsnprintf_s((char*) result.data(), size, _TRUNCATE, fmt, vl);
  va_end(vl);
  
  return result;
}

string str_format_v2(const char* fmt, ...) {
  string result;

  va_list args;
  va_start(args, format);
  size_t size = vsnprintf(nullptr, 0, format, args) + 1;
  va_end(args);
  
  result.resize(size);
  va_start(args, format);
  vsnprintf((char*) result.data(), size, format, args);
  va_end(args);
  
  return result;
}
