#!/usr/bin/env python
import pandas as pd
import numpy as np
import sys
import csv
from random import seed
from random import choice

mul, mur = sys.argv[1], sys.argv[2]
arr = [str(mul), str(mur)]
with open('hello.tsv', 'w') as f_output:
    tsv_output = csv.writer(f_output, delimiter='\n')
    tsv_output.writerow(arr)