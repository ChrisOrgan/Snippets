import os
from pathlib import Path
from subprocess import PIPE, STDOUT, Popen

def wrapper_phylip(phy_exec):
    '''
    Wrapper for running Phylip
    '''

    # Clear old files from Phylip
    old_files = ['outfile', 'outtree']
    for file in old_files:
        try:
            os.remove(file)
        except OSError:
            pass

    # Run phylip using standard 'infile'
    execute = 'phylip neighbor'
    phylip_sp = Popen([execute], cwd=phy_exec, shell=True, stdout=PIPE, stdin=PIPE, stderr=PIPE)
    phylip_sp.communicate(input=b'y')
