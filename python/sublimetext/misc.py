
# show message dialog
sublime.message_dialog('ok')


# print to console
print("message")


#process all file line by line
view = self.view
r = sublime.Region(0, view.size())

lines = view.lines(r)
res=""

for linereg in lines:
  linetext = view.substr(linereg)
  res += linetext
  
view.replace(edit, r, res)


# find in file
pos = view.find('^'+line+'$', 0)
