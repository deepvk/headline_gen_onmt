def unbpe(text):
    tokens = text.split()
    words = []
    for token in tokens:
        if not token.startswith("▁") and words:
            words[-1] += token
        else:
            if token.startswith("▁"):
                words.append(token[1:])
            else:
                words.append(token)
    if not words:
        words = [" "]
    return " ".join(words)


out = []
with open("/output.bpe", encoding="utf-8") as f:
    for line in f:
        out.append(unbpe(line.strip()))
with open("/output.txt", "wt", encoding="utf-8") as f:
    for line in out:
        f.write(line + "\n")
