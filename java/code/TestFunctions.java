import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.nio.file.DirectoryIteratorException;
import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Formatter;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.Optional;
import java.util.Comparator;
import java.util.stream.Stream;

import org.apache.commons.codec.binary.Hex;

import com.google.gson.Gson;


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
  
  public static String getBinString(long val, int size) {
    String res = Long.toBinaryString(val);
    
    int padLen = size - res.length();
    if (padLen > 0) {
      StringBuilder sb = new StringBuilder(padLen);
      for (int i = 0; i < padLen; i++) {
        sb.append("0");
      }
      res = sb.append(res).toString();
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
  
  public static void replaceStringBuilder(StringBuilder builder, String from, String to){
    int index = builder.indexOf(from);
    while (index != -1) {
        builder.replace(index, index + from.length(), to);
        index += to.length();
        index = builder.indexOf(from, index);
    }
  }
  
  private static void formatString() {
    int x=3, y=8;
    float res=((float)x/y);
    String sres=String.format("%.2f", res);
    Formatter f=new Formatter();
    f.format("%.2f",res);
    int z=(int) ((float)x/y*100);
    
    System.out.println(sres);
    System.out.println(f);
  }
  
  private static void regexFind() {
    String res="-not-found-";
    String file="icon.png";
    String path="C:/1-Roman/Documents/8-test/test";
    
    Pattern pat=Pattern.compile("\\.[\\w]+$");
    Matcher mat=pat.matcher(file);
    
    if(mat.find()){
      res=mat.group();
      res=res.substring(1);
    }
    System.out.println(res);
  }
  
  private static void sortCollection() {
    String text;
    ArrayList<String> list = new ArrayList<String>(); 
    list.add("qwe");
    list.add("asd");
    
    Collections.sort(list);
    
    text="";
    for(String value:list){
      text+=value+'\n';
    }
    System.out.println(text);
  }
  
  private static void toJson() {
    HashMap<String,String> map;
    map=new HashMap<String,String>();
    
    map.put("path","c:/documents");
    map.put("filter","png\njpg");
    map.put("name","cms");
    
    Gson gson = new Gson();
    String json = gson.toJson(map); 
    
    System.out.println(json);
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
  
  private static void readFile() {
    String doc="", line=null;
    
    try {
      BufferedReader br = new BufferedReader(new FileReader("templates/tree.html"));
      while ((line = br.readLine()) != null) {
         doc+=line;
      }
      System.out.println(doc);
    } catch (IOException e) {
      e.printStackTrace();
    }  
  }
  
  private static void readWholeFile() {
    String fpath="in.txt";
    try {
      Path path = Paths.get(fpath);
      byte[] data = Files.readAllBytes(path);
      
      String res=new String(data);
      System.out.println(res);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
  
  private static void createFile() {
    File dir,file;
    String dirName,fileName;
    
    dirName="export/text/";
    fileName=dirName+"new-file.txt";
    
    try{
      dir=new File(dirName);
      dir.mkdirs();
      
      file=new File(fileName);
      file.createNewFile();
      
      PrintWriter writer = new PrintWriter(fileName);
      
      writer.println("The first line");
      writer.println("The second line");
      writer.close();
      
      System.out.println("ok-file");
    }catch(Exception e){
      System.out.println("error-file");
    }
  }
  
  private static void scanDir() {
    // === 1
    Path dir = Paths.get("e:");
    try (DirectoryStream<Path> stream = Files.newDirectoryStream(dir)) {
      for (Path file: stream) {
          System.out.println(file.getFileName());
      }
    } catch (IOException | DirectoryIteratorException x) {
      System.err.println(x);
    }
    
    
    // === 2
    File f=new File("e:");
    String[] list=f.list();
    
    for(String item:list)
      System.out.println(item);
    
    System.out.println("\nEnd");
  }
  
    private static void readTests(){
    String path="test.txt";
    Path filePath = Paths.get(path);
    String doc="";
    BufferedReader br;
    
    // === 1
    
    InputStream in;
    try {
      in = Files.newInputStream(filePath);
      BufferedReader reader = new BufferedReader(new InputStreamReader(in));
      String line = null;
      while ((line = reader.readLine()) != null) {
        doc+=line;
      }
    } catch (IOException e) { }
  
    
    // === 2
    
    Charset charset=Charset.forName("UTF-8");
    String line = null;
    try {
      BufferedReader reader = Files.newBufferedReader(filePath, charset);
      while ((line = reader.readLine()) != null) {
          doc+=line+"\n";
      }
    } catch (IOException e) { }
    
    
    // === 3
    
    int SIZE=64*1024, res;
    byte[] buf = new byte[SIZE];
    long checkSum = 0L;
    int nRead;
    
    try {
      BufferedInputStream f = new BufferedInputStream( new FileInputStream( path ) );
      
      while ( (nRead=f.read( buf, 0, SIZE )) != -1 ){
        line=new String(buf);
        for ( int i=0; i<nRead; i++ )
          line+=(char) buf[i];
        doc+=line;
      }
    } catch (IOException e) { }
  
    
    // === 4
    
    SIZE=64*1024;
    char[] buf1=new char[SIZE];
    
    try {
      br = new BufferedReader(new InputStreamReader(new FileInputStream(path), "UTF-8"));
      while ((res = br.read(buf1,0,SIZE)) != -1) {
        line=new String(buf);
        for(int i=0;i<res;i++)
          line += buf[i];
        doc=line;
      }
    } catch (IOException e) { }
  
    
    // === 5
    
    try {
      br = new BufferedReader(new InputStreamReader(new FileInputStream(path), "UTF-8"));
      while ((line = br.readLine()) != null) {
        doc += line+"\n";
      }
    } catch (IOException e) { }
  }
  
  public static void nullableTests() {
    String val = "123";
    Optional<String> s = Optional.ofNullable(val);
    System.out.println(s);
    s.ifPresent(a -> System.out.println(a));
  }
  
  public static void streamTests() {
    String[] list = new String[] {
      "10", "1", "3", "2", "22"
    };
    
    Stream.of(list).sorted(Comparator.naturalOrder()).forEach(item -> {System.out.println(item);});
    Stream.of(list).sorted().forEach(item -> {System.out.println(item);});
  }
  
}
