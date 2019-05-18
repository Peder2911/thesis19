# coding: utf-8
"""
A function for handling csv-corpus files as defined in the
ModelComp framework
"""

def summarize(corpus):
    res = {}
    tokens = [pp(e) for e in corpus.data]
    res['ntoken'] = np.mean([len(ts) for ts in tokens])
    res['nchar'] = np.mean([len(txt) for txt in corpus.data])
    res['len'] = len(tokens)
    res['npos'] = sum(corpus.target)
    res['nneg'] = res['len'] - res['npos']
    
    alltokens = set()
    for entry in tokens:
        for t in entry:
            alltokens.add(t)
    res['utoken'] = len(alltokens)
    
    return(res)
