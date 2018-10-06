package general;

import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;

import org.apache.commons.codec.binary.Hex;

public class TestFunctions{

  public static String getBytesString(String str){
    String res = "";
    byte[] bytes = str.getBytes();
    for(int i=0; i< bytes.length; i++){
       res += (int) (bytes[i] & 0xff) + " ";
    }
    
    return res;
  }
  
  public static String getBytesString(byte[] bytes){
    String res = "";
    
    for(int i=0; i< bytes.length; i++){
      res += (int) (bytes[i] & 0xff) + " ";
    }
    
    return res;
  }
  
  public static String getBytesString(String str, String charset){
    String res = "";
    byte[] bytes;
    
    try {
      bytes = str.getBytes(charset);
      for(int i=0; i< bytes.length; i++){
        String add = "";
        if(bytes[i] == 0)
          add = "0";
        res += (int) (bytes[i] & 0xff) + add + " ";
      }
    }
    catch (UnsupportedEncodingException e) {
      e.printStackTrace();
      res = "[exception]";
    }
    
    return res;
  }
  
  public static String getBytesStringSigned(String str, String charset){
    String res = "";
    byte[] bytes;
    
    try {
      bytes = str.getBytes(charset);
      for(int i=0; i< bytes.length; i++){
        res += (int) (bytes[i]) + " ";
      }
    }
    catch (UnsupportedEncodingException e) {
      e.printStackTrace();
      res = "[exception]";
    }
    
    return res;
  }
  
  public static String getBytesStringHex(String str, String charset){
    String res = "";
    byte[] bytes;
    
    try {
      bytes = str.getBytes(charset);
      for(int i=0; i< bytes.length; i++){
        res += String.format("%02x", bytes[i] & 0xff) + " ";
      }
    }
    catch (UnsupportedEncodingException e) {
      e.printStackTrace();
      res = "[exception]";
    }
    
    return res;
  }
  
  public static String getBytesStringHex1(String str, String charset){
    String res = "";
    
    try {
      res = Hex.encodeHexString(str.getBytes(charset));
    }
    catch (UnsupportedEncodingException e) {
      e.printStackTrace();
      res = "[exception]";
    }
    
    return res;
  }
  
  public static String fixText(String str, String charset){
    String res = "";
    byte[] bytes;  
    
    try {
      bytes = str.getBytes(charset);
      for(int i=0; i< bytes.length; i++){
        if(bytes[i] == -109 || bytes[i] == -108){
          bytes[i] = 34;
        }
      }
      
      res = new String(bytes, charset);
    }
    catch (UnsupportedEncodingException e) {
      e.printStackTrace();
      res = "[exception]";
    }
    
    return res;
  }
  
  public static void writeFile(String text, String file, String enc){
    try {
      FileOutputStream fos = new FileOutputStream(file);
      OutputStreamWriter osw = new OutputStreamWriter(fos, enc);
      
      osw.write(text);
      osw.close();
    } 
    catch (Exception e) {
      e.printStackTrace();
    }
  }
  
  public static void writeFile(String text, String file, Charset enc){
    try {
      FileOutputStream fos = new FileOutputStream(file);
      OutputStreamWriter osw = new OutputStreamWriter(fos, enc);
      
      osw.write(text);
      osw.close();
    } 
    catch (Exception e) {
      e.printStackTrace();
    }
  }
  
  public static void replaceStringBuilder(StringBuilder builder, String from, String to){
    int index = builder.indexOf(from);
    while (index != -1) {
        builder.replace(index, index + from.length(), to);
        index += to.length();
        index = builder.indexOf(from, index);
    }
  }
  
}
