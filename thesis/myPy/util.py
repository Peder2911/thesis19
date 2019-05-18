
import csv
from collections import namedtuple

def csvCorpus(f):
    rd = csv.reader(f.readlines())
    next(rd)

    txt = []
    val = []

    for l in rd:
        txt.append(l[0])
        val.append(int(l[1]))

    corpus = namedtuple('corpus',['data','target'])
    corpus.data = txt
    corpus.target = val

    return(corpus)

