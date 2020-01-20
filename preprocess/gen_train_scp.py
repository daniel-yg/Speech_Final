from os import listdir
from os.path import isfile, join
pwd = "res/wav"

filelist = [f for f in listdir(pwd) if isfile(join(pwd, f))]
for f in filelist:
    f = f.split(".")
    if (f[1] == "wav"):
        print(f"{pwd}/{f[0]}.mfc")
