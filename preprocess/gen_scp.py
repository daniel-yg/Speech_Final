from os import listdir
from os.path import isfile, join
pwd = "res/wav"

filelist = [f for f in listdir(pwd) if isfile(join(pwd, f))]
for f in filelist:
    f = f.split(".")[0]
    print(f"{pwd}/{f}.wav {pwd}/{f}.mfc")
