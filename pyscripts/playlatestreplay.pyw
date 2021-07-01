import glob, os
os.startfile(max(glob.glob("C:\\Users\\Isaac Holston\\Videos\\*\\*.mp4"), key=os.path.getctime))
