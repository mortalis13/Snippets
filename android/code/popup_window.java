
private void openSavePopup() {
  final EditText presetTextField;
  Button btnSaveConfirm;
  ListView listPresets;
  PresetsAdapter listAdapter;
  
  // ---
  int layoutId = R.layout.load_popup;
  LayoutInflater inflater = (LayoutInflater) activity.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
  View popupView = inflater.inflate(layoutId, null);
  
  // ---
  presetTextField = popupView.findViewById(R.id.presetTextField);
  btnSaveConfirm = popupView.findViewById(R.id.btnSaveConfirm);
  listPresets = popupView.findViewById(R.id.listPresets);
  
  btnSaveConfirm.setOnClickListener(new View.OnClickListener() {
    public void onClick(View v) {
      Fun.log("Saving new Preset");
      String presetName = presetTextField.getText().toString();
      if (Fun.empty(presetName)) return;
      DatabaseManager.savePatternPreset(presetName);
    }
  });
  
  listPresets.setOnItemClickListener(new AdapterView.OnItemClickListener() {
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
      Fun.logd("Saving existing Preset");
      PresetItem item = (PresetItem) parent.getItemAtPosition(position);
      if (item == null) return;
      
      DatabaseManager.savePatternPreset(item.id);
    }
  });
  
  List<PatternMetaModel> patternsList = DatabaseManager.getPatternMetaList();
  List<PresetItem> items = new ArrayList<>();
  for (PatternMetaModel model: patternsList) {
    items.add(new PresetItem(model.getId(), model.getName()));
  }

  listAdapter = new SavePresetsListAdapter(activity, items);
  listPresets.setAdapter(listAdapter);
  
  if (listAdapter.getCount() > 10) {
    int itemHeight = Fun.measureListItemHeight(listAdapter);
    int divHeight = listPresets.getDividerHeight();
    LayoutParams layoutParams = listPresets.getLayoutParams();
    layoutParams.height = 10 * (itemHeight + divHeight);
    listPresets.setLayoutParams(layoutParams);
  }
  // ---
  
  Point size = new Point();
  activity.getWindowManager().getDefaultDisplay().getSize(size);
  int width = (int) (size.x * 0.8);
  int height = WindowManager.LayoutParams.WRAP_CONTENT;
  
  PopupWindow popupWindow;
  
  popupWindow = new PopupWindow(popupView, width, height);
  popupWindow.setBackgroundDrawable(new ColorDrawable(Color.WHITE));
  popupWindow.setOutsideTouchable(true);
  popupWindow.setFocusable(true);
  popupWindow.showAsDropDown(btnSavePreset, 0, 5);
  
  // dim
  View container = popupWindow.getContentView().getRootView();
  Context context = popupWindow.getContentView().getContext();
  WindowManager wm = (WindowManager) context.getSystemService(Context.WINDOW_SERVICE);
  WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
  p.flags |= WindowManager.LayoutParams.FLAG_DIM_BEHIND;
  p.dimAmount = 0.3f;
  wm.updateViewLayout(container, p);
}
