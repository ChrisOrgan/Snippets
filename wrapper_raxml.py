# runs from terminal only (not interactive)
import os
import random
import shutil
import sys
from Bio import Phylo
from Bio.Phylo.Applications import RaxmlCommandline

raxml_cline = RaxmlCommandline(sequences='Primates_short.fasta',
                               model='GTRGAMMA', name='biopython',
                               num_replicates='10',
                               parsimony_seed=random.randint(0, sys.maxsize),
                               working_dir=os.getcwd() + os.sep + 'bp_rx')
print(raxml_cline)

try:
    os.mkdir('bp_raxml')
except OSError:
    shutil.rmtree('bp_raxml')
    os.mkdir('bp_raxml')

out, err = raxml_cline()
