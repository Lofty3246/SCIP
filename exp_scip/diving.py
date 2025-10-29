def myheurdiving(mayrounddown, mayroundup, candsfrac, candsol, nlocksdown, nlocksup, obj, objnorm, pscostdown, pscostup, rootsolval, nNonz, isBinary):
    score = 0.0
    roundup = False

    # Base score weighted by normalized objective contribution
    score += (obj / (objnorm + 1e-9)) * 5 if objnorm > 0 else 0

    # Penalize rounding options to encourage exploration
    score -= nlocksdown * 7 if mayrounddown else 0 
    score -= nlocksup *7 if mayroundup else 0
    # Favor large fractions away from 0.5 for exploration
    score += abs(candsfrac - 0.5) * 10

    # Adjust score based on solution value and its contribution
    score += (candsol / (1 + abs(rootsolval) * obj)) * 4 if rootsolval != 0 else 0

    # Employ pseudo costs to influence rounding decisions
    if pscostdown < 0 and mayrounddown:
        score += (-pscostdown) * 3  # Favor rounding down with negative pseudo costs
    if pscostup < 0 and mayroundup:
        score -= (-pscostup) * 3  # Discourage rounding up with negative pseudo costs

    # Determine rounding direction based on fractional part and exploration potential
    if candsfrac >= 0.7 and mayroundup:
        roundup = True
    elif candsfrac <= 0.3 and mayrounddown:
        roundup = False

    # Encourage solutions with fewer nonzero entries
    score += (1 / (nNonz + 1)) * 2 if nNonz > 0 else 0

    return score, roundup