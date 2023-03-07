#!/usr/bin/env python
import pandas as pd
import numpy as np
import sys
import csv
from random import seed
from random import choice

def singleMap(read_length:int, mul_arr, mur_arr):
    single_logic = []
    for i in range(len(mul_arr)):
        if i + read_length - 1 > len(mur_arr) - 1:
            break
        if mul_arr[i] <= read_length or \
        mur_arr[i + read_length - 1] <= read_length:
            single_logic.append(True) # Read maps uniquely
        else:
            single_logic.append(False) # Read does not map uniquely
    return (len(single_logic) - sum(single_logic)) / len(single_logic)

def pairMap(read_length:int, fragment_length:int, fragment_std:int, mul_arr, mur_arr):
    np.random.seed(0)
    pair_logic = []
    distr = np.random.normal(fragment_length, fragment_std, len(mul_arr))
    for i in range(len(mul_arr)):
        if i + int(distr[i]) - 1 > len(mur_arr) - 1:
            break
        if mul_arr[i] <= read_length or \
        mur_arr[i + int(distr[i]) - 1] <= read_length:
            pair_logic.append(True) # Read maps uniquely
        else:
            pair_logic.append(False) # Read does not map uniquely
    return (len(pair_logic) - sum(pair_logic)) / len(pair_logic)

def spectral_function(arr):
    spectral_dict = {'15': 0, '20': 0, '25': 0, '35': 0, '50': 0, '100': 0, '300': 0, '1000': 0, '10000': 0, '97700': 0}
    for i in arr:
        if i > 0 and i <= 15:
            spectral_dict['15'] += 1
        if i > 15 and i <= 20:
            spectral_dict['20'] += 1
        if i > 20 and i <= 25:
            spectral_dict['25'] += 1
        if i > 25 and i <= 35:
            spectral_dict['35'] += 1
        if i > 35 and i <= 50:
            spectral_dict['50'] += 1
        if i > 50 and i <= 100:
            spectral_dict['100'] += 1
        if i > 100 and i <= 300:
            spectral_dict['300'] += 1
        if i > 300 and i <= 1000:
            spectral_dict['1000'] += 1
        if i > 1000 and i <= 10000:
            spectral_dict['10000'] += 1
        if i > 10000 and i <= 97700:
            spectral_dict['97700'] += 1
        #Don't forget to calculate values greater than 97700!!!
    return spectral_dict

test_mul = pd.read_csv(sys.argv[1], sep='\t')
test_mul_arr = telomere_mul["fixedStep chrom=chr1 start=56 step=1"]
test_mur = pd.read_csv(sys.argv[2], sep='\t')
test_mur_arr = telomere_mur["fixedStep chrom=chr1 start=56 step=1"]

test_single_arr = []
for x in range(1,5001):
    test_single_arr.append(singleMap(x, test_mul_arr, test_mur_arr))
with open('test_single.tsv', 'w') as test_single_f_output:
    test_single_tsv_output = csv.writer(test_single_f_output, delimiter='\n')
    test_single_tsv_output.writerow(test_single_arr)

test_pair_arr = []
for x in range(1,301):
    test_pair_arr.append(pairMap(x, 700, 50, test_mul_arr, test_mur_arr))
with open('test_pair.tsv', 'w') as test_pair_f_output:
    test_pair_tsv_output = csv.writer(test_pair_f_output, delimiter='\n')
    test_pair_tsv_output.writerow(test_pair_arr)

test_mate_pair_arr = []
for x in range(1,301):
    test_mate_pair_arr.append(pairMap(x, 5000, 500, test_mul_arr, test_mur_arr))
with open('test_mate_pair.tsv', 'w') as test_mate_pair_f_output:
    test_mate_pair_tsv_output = csv.writer(test_mate_pair_f_output, delimiter='\n')
    test_mate_pair_tsv_output.writerow(test_mate_pair_arr)

test_spec_dict = spectral_function(test_mul_arr)
spectral_for_save = pd.DataFrame(test_spec_dict.items())
spectral_for_save.to_csv('spectral_plot.tsv', sep="\t")

# arr = [str(mul), str(mur)]
# with open('hello.tsv', 'w') as f_output:
#     tsv_output = csv.writer(f_output, delimiter='\n')
#     tsv_output.writerow(arr)