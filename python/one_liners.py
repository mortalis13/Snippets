# == General

# open-read-close file
with open('f.txt') as f: text = f.read()
f=open('f.txt','w');f.write('text');f.close()


# == SublimeText

# split tab text to a list of lines
view.substr(sublime.Region(0, view.size())).split('\n')

# reencode each line
e='cp1251'; a=view.substr(sublime.Region(0, view.size())).split('\n'); view.run_command('select_all'); [view.run_command('insert', {"characters": x.encode(e).decode()+'\n'}) for x in a]

# modify the view content in another tab
a=view.substr(sublime.Region(0, view.size())).split('\n'); v=window.new_file(); [v.run_command('insert', {"characters": x+'_end'+'\n'}) for x in a]

# replace view content
view.run_command('select_all'); view.run_command('insert', {"characters": 'text'})
view.sel().add(sublime.Region(0, view.size())); view.run_command('insert', {"characters": 'text'})

# remove all from view
view.run_command('select_all'); view.run_command('left_delete')
view.sel().add(sublime.Region(0, view.size())); view.run_command('left_delete')

# convert selected numbers to hex and print to the console
# (to change the active view content the whole text should be replaced)
[print('0x'+hex(int(view.substr(x))).replace('0x','').zfill(6)) for x in view.sel()]
