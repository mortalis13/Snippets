List<String> items = new ArrayList<>();
items.add("Item_1");
items.add("Item_2");
items.add("Item_3");
ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, items);

ListView listView = findViewById(R.id.listView);
listView.setAdapter(adapter);
