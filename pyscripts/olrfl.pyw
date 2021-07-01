import subprocess, glob, os
cmd = 'explorer ' + max(glob.glob("C:\\Users\\Isaac Holston\\Videos\\*\\*.mp4"), key=os.path.getctime).rpartition('\\')[0]
subprocess.Popen(cmd)
