"""
called by the corresponding vimscript
"""

from sys import argv
import os

path = argv[1]
while path:
    path, filename = os.path.split(path)
    underscore_proj_path = os.path.join( path, "_proj.vim" )
    if os.path.exists(underscore_proj_path):
        print(underscore_proj_path)
        exit()
