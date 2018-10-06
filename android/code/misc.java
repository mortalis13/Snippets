// --- get default android attributes in custom view constructor

public CustomView(Context context, AttributeSet attrs) {
  int[] attrIds = {android.R.attr.textSize};
  TypedArray a = context.obtainStyledAttributes(attrs, attrIds);
  // (array id from 'attrIds', default)
  float textSize = a.getDimension(0, 0);
  a.recycle();
}
