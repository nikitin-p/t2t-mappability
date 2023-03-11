#!/usr/bin/env python
import pandas as pd
import numpy as np
import sys
import csv
from random import seed
from random import choice

def spectral_function(arr):
    spectral_dict = {'15': 0, '20': 0, '25': 0, '35': 0, '50': 0, '100': 0, '300': 0, '1000': 0, '10000': 0, '97700': 0, 'more': 0}
    for i in arr:
        if 'fixedStep' in i:
            continue
        if int(i) > 0 and int(i) <= 15:
            spectral_dict['15'] += 1
        if int(i) > 15 and int(i) <= 20:
            spectral_dict['20'] += 1
        if int(i) > 20 and int(i) <= 25:
            spectral_dict['25'] += 1
        if int(i) > 25 and int(i) <= 35:
            spectral_dict['35'] += 1
        if int(i) > 35 and int(i) <= 50:
            spectral_dict['50'] += 1
        if int(i) > 50 and int(i) <= 100:
            spectral_dict['100'] += 1
        if int(i) > 100 and int(i) <= 300:
            spectral_dict['300'] += 1
        if int(i) > 300 and int(i) <= 1000:
            spectral_dict['1000'] += 1
        if int(i) > 1000 and int(i) <= 10000:
            spectral_dict['10000'] += 1
        if int(i) > 10000 and int(i) <= 97700:
            spectral_dict['97700'] += 1
        if int(i) > 97700:
            spectral_dict['more'] += 1
        #Don't forget to calculate values greater than 97700!!!
    return spectral_dict

name_of_region = str(sys.argv[1]).split(".")[1]

test_mul = pd.read_csv(sys.argv[1], sep='\t')
test_mul_arr = test_mul[str(test_mul.columns[0])]
test_mur = pd.read_csv(sys.argv[2], sep='\t')
test_mur_arr = test_mur[str(test_mur.columns[0])]

test_spec_mul_dict = spectral_function(test_mul_arr)
spectral_mul_for_save = pd.DataFrame(test_spec_mul_dict.items())
spectral_mul_for_save.to_csv(name_of_region + 
'_mul_spectral_plot.tsv', sep="\t")

test_spec_mur_dict = spectral_function(test_mur_arr)
spectral_mur_for_save = pd.DataFrame(test_spec_mur_dict.items())
spectral_mur_for_save.to_csv(name_of_region + '_mur_spectral_plot.tsv', sep="\t")

# arr = [str(mul), str(mur)]
# with open('hello.tsv', 'w') as f_output:
#     tsv_output = csv.writer(f_output, delimiter='\n')
#     tsv_output.writerow(arr)