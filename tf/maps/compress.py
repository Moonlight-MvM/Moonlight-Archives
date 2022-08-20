
#Compresses all the .nav files into .bz2 for space savings.

from bz2 import open as bz2_open
from os import listdir, remove
from shutil import copyfileobj

for x in listdir():
    if x.endswith(".nav"):
        with open(x, "rb") as f, bz2_open(x + ".bz2", "wb") as g:
            copyfileobj(f, g, 1*1024*1024)
        remove(x)

print("Done")
input("Press Enter to exit...")


