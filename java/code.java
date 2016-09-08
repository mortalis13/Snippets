
// HttpServletRequest request list all parameters

Map map = request.getParameterMap();

for (Object key: map.keySet()) {
  System.out.println(key + " " + map.get(key));
}


// List map entries

for (Map.Entry<String, Integer> entry : map.entrySet()) {
    String key = entry.getKey().toString();
    Integer value = entry.getValue();
    System.out.println("key, " + key + " value " + value);
}

