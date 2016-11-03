
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
