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
    return single_logic

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
    return pair_logic

def array_to_bed(arr):
    out = []
    pair = []
    for i in range(len(arr)):
        if i == 0:
            prev = True
        else:
            prev = arr[i-1]   
        if arr[i]==False and prev==True:
            pair.append(i)
        if arr[i]==True and prev==False:
            pair.append(i-1)
            out.append(pair)
            pair=[]
        if i == len(arr)-1 and arr[i]==False:
            pair.append(i)
            out.append(pair)
            pair=[]
    return out

name_of_region = str(sys.argv[1]).split(".")[1]

test_mul = pd.read_csv(sys.argv[1], sep='\t', encoding='utf-8', engine='python')

test_mur = pd.read_csv(sys.argv[2], sep='\t', encoding='utf-8', engine='python')

chr_name = list(test_mul.columns.values)[0].split(' ')[1].split('=')[1]

spacing = int(list(test_mur.columns.values)[0].split(' ')[2].split('=')[1])

test_mul = test_mul.iloc[56:].reset_index()
test_mul_arr = test_mul[str(test_mul.columns[0])]

test_mur = test_mur.iloc[:-56]
test_mur_arr = test_mur[str(test_mur.columns[0])]

#start = 56
min_read_length = 150
#single_res = singleMap(x, mul_arr, mur_arr)
#single_arr = array_to_bed(single_res)
pair_res = pairMap(min_read_length, 700, 50, test_mul_arr, test_mur_arr)
pair_arr = array_to_bed(pair_res)

single_res = singleMap(min_read_length, test_mul_arr, test_mur_arr)
single_arr = array_to_bed(single_res)

with open(name_of_region + '_pair_reads_unmappable.bed', 'w') as test_pair_f_output:
    for i in pair_arr:
        print(chr_name + '\t' + str(i[0] + spacing) + '\t' + str(i[1] + spacing), file=test_pair_f_output)

with open(name_of_region + '_single_reads_unmappable.bed', 'w') as test_single_f_output:
    for i in single_arr:
        print(chr_name + '\t' + str(i[0] + spacing) + '\t' + str(i[1] + spacing), file=test_single_f_output)