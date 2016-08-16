import os


# list all files and folders in the current dir (1 level)

dir = "path\\to"
res = os.listdir(dir)
print(res)


# all files-folders to dictionary (recurse)

dir = "path\\to"
res = {}
for root, dirs, files in os.walk(dir):
  res[root] = files
return res


# all files paths to a list (recurse)

dir = "path\\to"
file_paths = []
for root, dirs, files in os.walk(dir):
  for filename in files:
    filepath = os.path.join(root, filename)
    file_paths.append(filepath)


# get only files in the level 1

for root, dirs, files in os.walk(dir):
  return files
