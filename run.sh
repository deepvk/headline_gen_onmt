#!/bin/bash

wc -l /input.txt
python /bpe.py
wc -l /input.bpe
mv /ria-model_40_step_100000.pt /OpenNMT-py/
cd /OpenNMT-py && python translate.py -model ria-model_40_step_100000.pt -src /input.bpe -output /output.bpe -replace_unk -gpu 0 
wc -l /output.bpe
python /unbpe.py
wc -l /output.txt
