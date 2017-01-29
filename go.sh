#!/bin/bash

# first install miniconda then:
#
# conda create -n style-transfer python=2.7.9
# source activate style-transfer
# conda install -c conda-forge tensorflow=0.11.0
# conda install scipy pillow

# then
# git clone https://github.com/lengstrom/fast-style-transfer.git

source activate style-transfer
rm -rf ./work/
mkdir ./work
cp -R fast-style-transfer me.png *.ckpt ./work/
cd work
mv ./me.png ./fast-style-transfer/
mv ./*.ckpt ./fast-style-transfer/
cd ./fast-style-transfer
echo rain-princess
python evaluate.py --checkpoint ./rain-princess.ckpt --in-path ./me.png --out-path ./output-rp.png
# la-muse.ckpt        rain-princess.ckpt  scream.ckpt         udnie.ckpt          wave.ckpt           wreck.ckpt
echo la-muse.ckpt
python evaluate.py --checkpoint ./la-muse.ckpt --in-path ./me.png --out-path ./output-lm.png
echo scream.ckpt
python evaluate.py --checkpoint ./scream.ckpt --in-path ./me.png --out-path ./output-sm.png
echo udnie.ckpt
python evaluate.py --checkpoint ./udnie.ckpt --in-path ./me.png --out-path ./output-ud.png
echo wave.ckpt
python evaluate.py --checkpoint ./wave.ckpt --in-path ./me.png --out-path ./output-wv.png
echo wreck.ckpt
python evaluate.py --checkpoint ./wreck.ckpt --in-path ./me.png --out-path ./output-wk.png
echo maybe done?
cp output-*.png ../
