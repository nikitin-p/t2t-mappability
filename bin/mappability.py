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

name_of_region = str(sys.argv[1]).split(".")[1]

test_mul = pd.read_csv(sys.argv[1], sep='\t')
test_mul_arr = test_mul[str(test_mul.columns[0])]
test_mur = pd.read_csv(sys.argv[2], sep='\t')
test_mur_arr = test_mur[str(test_mur.columns[0])]

test_single_arr = []
for x in range(1,5001):
    test_single_arr.append(singleMap(x, test_mul_arr, test_mur_arr))
with open(name_of_region + '_single.tsv', 'w') as test_single_f_output:
    test_single_tsv_output = csv.writer(test_single_f_output, delimiter='\n')
    test_single_tsv_output.writerow(test_single_arr)

test_pair_arr = []
for x in range(1,301):
    test_pair_arr.append(pairMap(x, 700, 50, test_mul_arr, test_mur_arr))
with open(name_of_region + '_pair.tsv', 'w') as test_pair_f_output:
    test_pair_tsv_output = csv.writer(test_pair_f_output, delimiter='\n')
    test_pair_tsv_output.writerow(test_pair_arr)

test_mate_pair_arr = []
for x in range(1,301):
    test_mate_pair_arr.append(pairMap(x, 5000, 500, test_mul_arr, test_mur_arr))
with open(name_of_region + '_mate_pair.tsv', 'w') as test_mate_pair_f_output:
    test_mate_pair_tsv_output = csv.writer(test_mate_pair_f_output, delimiter='\n')
    test_mate_pair_tsv_output.writerow(test_mate_pair_arr)

# arr = [str(mul), str(mur)]
# with open('hello.tsv', 'w') as f_output:
#     tsv_output = csv.writer(f_output, delimiter='\n')
#     tsv_output.writerow(arr)