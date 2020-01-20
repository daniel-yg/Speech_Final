REM type "C:\Users\rebellion\Documents\Kuliah stuff\2019(2)\Speech\Tubes (2)\res\all.lex" | "preprocess/remove_dupes.py" > "res/all.lex"

REM type "C:\Users\rebellion\Documents\Kuliah stuff\2019(2)\Speech\Tubes (2)\wlist" | "preprocess/remove_dupes.py" > "wlist"

HDMan -A -D -T 1 -m -w wlist -n monophones1 -i -l dlog dict res/all.lex

type "C:\Users\rebellion\Documents\Kuliah stuff\2019(2)\Speech\Tubes (2)\res\all.lab" | "preprocess/mlf.py" > words.mlf

HLEd -A -D -T 1 -l * -d dict -i phones0.mlf mkphones0.led words.mlf
HLEd -A -D -T 1 -l * -d dict -i phones1.mlf mkphones1.led words.mlf

"preprocess/gen_scp.py" > codetrain.scp

HCopy -A -D -T 1 -C wav_config -S codetrain.scp

"preprocess/gen_train_scp.py" > train.scp

HCompV -A -D -T 1 -C config -f 0.01 -m -S train.scp -M hmm0 proto

HERest -A -D -T 1 -C config -I phones0.mlf -t 250.0 150.0 1000.0 -S train.scp -H hmm0/macros -H hmm0/hmmdefs -M hmm1 monophones0
HERest -A -D -T 1 -C config -I phones0.mlf -t 250.0 150.0 1000.0 -S train.scp -H hmm1/macros -H hmm1/hmmdefs -M hmm2 monophones0
HERest -A -D -T 1 -C config -I phones0.mlf -t 250.0 150.0 1000.0 -S train.scp -H hmm2/macros -H hmm2/hmmdefs -M hmm3 monophones0

REM copy hmm3 to hmm4, change a bit of stuff, then

