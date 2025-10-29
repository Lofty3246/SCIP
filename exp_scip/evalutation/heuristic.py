# example heuristic
# replace it with your own heuristic designed by EoH

# def score(item, bins):
#     scores = item - bins
#     return scores

# import numpy as np

# def score(item, bins):
#     # Filter bins that can accommodate the item
#     feasible_bins = bins[bins >= item]
    
#     if len(feasible_bins) == 0:
#         return np.array([])  # No feasible bins

#     # Calculate scores for each feasible bin
#     capacity_ratio = (feasible_bins - item) / (feasible_bins + 1e-6)
#     utilization_penalty = np.log(feasible_bins + 1e-6)  # Log penalty for bins with larger capacities

#     scores = capacity_ratio - utilization_penalty

#     return scores

import numpy as np

def score(item, bins):
    # Filter out bins that cannot accommodate the item
    feasible_bins = bins[bins > item]

    # Initialize scores
    scores = np.zeros_like(bins)

    if feasible_bins.size > 0:
        total_capacities = feasible_bins
        remaining_capacities = total_capacities - item
        
        # Calculate linear utilization ratio
        utilization_ratios = item / total_capacities
        
        # Calculate logarithmic remaining capacity factor
        remaining_capacity_factor = np.log(remaining_capacities + 1) / np.log(total_capacities + 1)  # Adding 1 to avoid log(0)
        
        # Fixed penalty for under-utilization
        under_utilization_penalty = 2 * (total_capacities < bins.max() / 2).astype(int)  # Penalize bins that are less than half full

        # Score calculation
        scores[bins > item] = utilization_ratios * remaining_capacity_factor - under_utilization_penalty

    return scores