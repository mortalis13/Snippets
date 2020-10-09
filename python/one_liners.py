# == General

# open-read-close file
with open('f.txt') as f: text = f.read()


# == SublimeText

# split tab text to a list of lines
view.substr(sublime.Region(0, view.size())).split('\n')
