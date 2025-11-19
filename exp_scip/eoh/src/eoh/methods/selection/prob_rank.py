import random
def parent_selection(pop,m):
    ranks = [i for i in range(len(pop))]
    probs = [1 / (rank + 1 + len(pop)) for rank in ranks]
    # 有放回抽样 choices
    parents = random.choices(pop, weights=probs, k=m)
    return parents

# 对父代的选择: 基于排名概率选择m个父代,