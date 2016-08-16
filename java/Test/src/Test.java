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

import com.google.gson.Gson;

public class Test {
  
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
  
  private static void stringReplace() {
    String s="123qweasd";
    s=s.replace("qwe", "zxc");
    System.out.println(s);
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

  public static void main(String[] args) {
  }

}
