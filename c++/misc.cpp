#include <iostream>
#include <fstream>
#include <regex>

#include <iconv.h>

using namespace std;

// ----------------------------------------------------

bool fileExists(string fileName) {
  fstream f(fileName);
  return f.good();
}


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


template<typename T> string toStr(T number) {
  ostringstream ss;
  ss << number;
  return ss.str();
}


void exception_test() {
  try {
    throw std::runtime_error("Error text");
  }
  catch(std::exception &e) {
    cout << "Text: " << e.what();
  }
}


void string_types() {
  string s;
  u16string s16;
  u32string s32;
  wstring ws;
  
  basic_string<char16_t> s16raw;
  basic_string<unsigned> us;

  char c;
  char16_t c16;
  char32_t c32;
  wchar_t wc;

  s = "abc";
  s16 = u"abc";
  s32 = U"abc";
  ws = L"abc";
  
  s16raw = u"abc";
  us = {0x61, 0x62, 0x63};

  // -------------------------
  fstream f("bin_file", ios_base::out | ios_base::binary);
  
  char nl = 0x0d;

  cout << "\nu16string 'abc'\n";
  for (auto ct: s16) {
    f.write((char*) &ct, sizeof(ct));
    cout << hex << ct << " "; // 61 62 63
  }
  f.write(&nl, 1);
  cout << '\n';
  
  cout << "\nu32string 'abc'\n";
  for (auto ct: s32) {
    f.write((char*) &ct, sizeof(ct));
    cout << hex << ct << " "; // 61 62 63
  }
  f.write(&nl, 1);
  cout << '\n';

  cout << "\nwstring 'abc'\n";
  for (auto ct: s32) {
    f.write((char*) &ct, sizeof(ct));
    cout << hex << ct << " "; // 61 62 63
  }
  f.write(&nl, 1);
  cout << '\n';

  cout << "\nbasic_string<char16_t> 'abc'\n";
  for (auto ct: s16raw) {
    f.write((char*) &ct, sizeof(ct));
    cout << hex << ct << " "; // 61 62 63
  }
  f.write(&nl, 1);
  cout << '\n';

  cout << "\nbasic_string<unsigned> 'abc'\n";
  for (auto ct: us) {
    f.write((char*) &ct, sizeof(ct));
    cout << hex << ct << " "; // 61 62 63
  }
  f.write(&nl, 1);
  cout << '\n';

  f.close();
}


void print_bytes_as_hex() {
  string s = "";
  uint8_t data[] = {0x21, 0x44, 0x10};
  int size = 3;
  
  for (int i = 0; i < size; ++i) {
    char buf[10];
    int n = sprintf(buf, "%02x ", data[i]);
    s += string(buf, n);
  }
  
  printf("%s\n", s.c_str());
}

void dump_bytes_from_string(const string& str) {
  string bytesStr;
  
  for (auto c: str) {
    char buf[10];
    int n = sprintf(buf, "%02x ", (unsigned char) c);
    bytesStr += string(buf, n);
  }
  
  printf("%s\n", bytesStr.c_str());
}

void dump_bytes_from_unicode_string(const u32string& str) {
  string bytesStr = "";
  
  char* pStr = (char*) str.data();
  size_t len = str.size() * sizeof(char32_t);
  
  for (size_t i = 0; i < len; i++) {
    char buf[10];
    int n = sprintf(buf, "%02x ", pStr[i]);
    bytesStr += string(buf, n);
  }
  
  printf("%s\n", bytesStr.c_str());
}


string str16to8(u16string str16){
  const char16_t* str = str16.data();
  size_t len = str16.size() * sizeof(char16_t);
  
  iconv_t conv = iconv_open("UTF-8", "UTF-16LE");

  size_t dstlen = len + 1;
  char* dst = (char*) calloc(dstlen, 1);
  char* res = dst;

  size_t ires = iconv(conv, (char**) &str, &len, &dst, &dstlen);
  iconv_close(conv);

  string resstr(res);
  return resstr;
}


string str16to8(const char16_t* str, size_t len){
  iconv_t conv = iconv_open("UTF-8", "UTF-16LE");

  size_t dstlen = len + 1;
  char* dst = (char*) calloc(dstlen, 1);
  char* res = dst;

  size_t ires = iconv(conv, (char**) &str, &len, &dst, &dstlen);

  iconv_close(conv);
  string resstr(res);

  return resstr;
}


bool regexMatch(string text, string pattern) {
  regex rx(pattern);
  return regex_search(text, rx);
}


string getFileName(string filePath) {
  string res = filePath;
  string p = R"(([^/\\]+)\.[^.]+$)";
  
  try {
    regex rx(p);
    
    smatch m;
    bool found = regex_search(filePath, m, rx);
    
    if (found) {
      res = m.str(1);
    }
  }
  catch (const regex_error& e) {
    printf("Regex error: [%s], %s, code: %d\n", p.c_str(), e.what(), e.code());
  }
  
  return res;
}


void string_trim(string& str) {
  string res;
  
  size_t pos_start = str.find_first_not_of(" \t\r\n");
  size_t pos_end = str.find_last_not_of(" \t\r\n");
  
  if (pos_start == npos || pos_end == npos) {
    str = "";
  }
  else {
    str = str.substr(pos_start, pos_end - pos_start + 1);
  }
}
