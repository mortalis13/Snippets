// --- get default android attributes in custom view constructor

public CustomView(Context context, AttributeSet attrs) {
  int[] attrIds = {android.R.attr.textSize};
  TypedArray a = context.obtainStyledAttributes(attrs, attrIds);
  // (array id from 'attrIds', default)
  float textSize = a.getDimension(0, 0);
  a.recycle();
}


// --- set tint for 9-patch drawable background
Drawable drawable = bMenu.getBackground();
ColorStateList colors = ColorStateList.valueOf(Color.RED);
final Drawable wrappedDrawable = DrawableCompat.wrap(drawable);
DrawableCompat.setTintList(wrappedDrawable, colors);
bMenu.setBackground(wrappedDrawable);
