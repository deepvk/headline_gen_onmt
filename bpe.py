import sentencepiece as spm
from nltk.tokenize import sent_tokenize

sp = spm.SentencePieceProcessor()
sp.load("ria.model")

inp = []

with open("/input.txt", encoding="utf-8") as f:
    for line in f:
        sents = sent_tokenize(line.strip())
        if len(sents):
            sent = sents[0]
        else:
            sent = "а"
        inp.append(" ".join(sp.EncodeAsPieces(sent)))
with open("/input.bpe", "wt", encoding="utf-8") as f:
    for line in inp:
        f.write(line + "\n")
