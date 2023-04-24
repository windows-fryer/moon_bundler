import os
import shutil

# Delete the bundle file if it exists

if os.path.exists("bundle/bundle.lua"):
    os.remove("bundle/bundle.lua")

# Loop through all the files in the src directory and store it in a list. 

files = []

for root, dirs, file in os.walk("src"):
    for f in file:
        files.append(os.path.join(root, f))
    
# Run the moon system command to compile the files

for file in files:
    os.system(f"moonc {file} -t build/")

# Run the command to bundle the project

os.system("tape build/src -o bundle/bundle.lua")