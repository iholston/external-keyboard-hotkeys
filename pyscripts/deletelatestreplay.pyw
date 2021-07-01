import glob, os
os.remove(max(glob.glob("C:\\Users\\Isaac Holston\\Videos\\*\\*.mp4"), key=os.path.getctime))
