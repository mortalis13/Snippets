
// --- Print all charsets

SortedMap<String, Charset> availableCharsets = Charset.availableCharsets();
for(String key: availableCharsets.keySet()){
  String charset = availableCharsets.get(key).displayName();
  System.out.println(charset);
}



// --- HttpServletRequest request list all parameters

Map map = request.getParameterMap();

for (Object key: map.keySet()) {
  System.out.println(key + " " + map.get(key));
}



// --- List map entries

for (Map.Entry<String, Integer> entry : map.entrySet()) {
  String key = entry.getKey().toString();
  Integer value = entry.getValue();
  System.out.println("key, " + key + " value " + value);
}



// --- Spring model/request attributes

// -------------------------
System.out.println("\n\n=== START Model attributes ===\n");

Map md = model.asMap();
for (Object modelKey : md.keySet()) {
  Object modelValue = md.get(modelKey);
  System.out.println("-- " + modelKey + "\n" + modelValue + "\n");
}

System.out.println("\n=== Request parameters ===\n");

Enumeration<String> reqParamsEnum = request.getParameterNames();
while (reqParamsEnum.hasMoreElements()) {
  String s = reqParamsEnum.nextElement();
  System.out.println("-- " + s);
  System.out.println(request.getParameter(s) + "\n");
}

System.out.println("\n=== Request attributes ===\n");

Enumeration<String> reqAttrEnum = request.getAttributeNames();
while (reqAttrEnum.hasMoreElements()) {
  String s = reqAttrEnum.nextElement();
  System.out.println("-- " + s);
  System.out.println(request.getAttribute(s) + "\n");
}

System.out.println("\n=== END Model attributes ===\n\n");
// -------------------------



// === Create .doc file using POI (HWPF) ===

// --- Maven ---
// put a template document to src/main/resources

// add dependencies
//   org.apache.poi:poi:3.9
//   org.apache.poi:poi-scratchpad:3.9
//   org.apache.poi:poi-ooxml:3.9
//   org.apache.poi:poi-ooxml-schemas:3.9
//   org.apache.xmlbeans:xmlbeans:2.6.0

// add plugin to pom.xml (<build><plugins> section)
// 
// <plugin>
//   <artifactId>maven-resources-plugin</artifactId>
//   <version>2.5</version>
//   <configuration>
//     <encoding>UTF-8</encoding>
//     <nonFilteredFileExtensions>
//       <nonFilteredFileExtension>doc</nonFilteredFileExtension>
//     </nonFilteredFileExtensions>
//   </configuration>
// </plugin>
// 

// --- read resouce template
// ClassLoader classLoader = getClass().getClassLoader();
// InputStream is = classLoader.getResourceAsStream("empty.doc");

// -------

InputStream is = new FileInputStream("empty.doc")

// POIFSFileSystem fs = new POIFSFileSystem(is);
HWPFDocument doc = new HWPFDocument(is);

Range range = doc.getRange();
range.insertBefore("text");

// Paragraph paragraph = range.getParagraph(0);
// paragraph.insertAfter("asd");
// range.getCharacterRun(0).insertAfter("-333");


// --- Convert ArrayList to array

String[] countries = list.toArray(new String[list.size()]);


// --- Download file from a web page

response.setContentType("application/pdf");
response.setHeader("Content-Disposition", "attachment;filename=downloadfilename.pdf");

byte[] pdfBytes = null;
ServletOutputStream out = response.getOutputStream();
out.write(pdfBytes, 0, pdfBytes.length);

out.flush();
out.close();


// --- Download ZIP

ByteArrayOutputStream baos = new ByteArrayOutputStream();
ZipOutputStream zos = new ZipOutputStream(baos);

zos.putNextEntry(new ZipEntry(fileName));
zos.write(bytes, 0, bytes.length);
zos.closeEntry();

zos.flush();
baos.flush();
zos.close();
baos.close();

byte[] zip = baos.toByteArray();
// [download with "application/zip"]
