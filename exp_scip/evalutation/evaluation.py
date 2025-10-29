import numpy as np


class Evaluation():
    def __init__(self):
        
        self.instances=None

    def evaluateGreedy(self,instances: dict,alg) -> float:

        """Evaluate heuristic function on a set of online binpacking instances."""
       
        num_bins = []
        # Perform online binpacking for each instance.
        #print(len(instances))
        for name in instances:
            #print(name)
            instance = instances[name]
            capacity = instance['capacity']
            items = np.array(instance['items'])

           
            bins = np.array([capacity for _ in range(instance['num_items'])])
            
            _, bins_packed = self.online_binpack(items, bins, alg)
           
            num_bins.append((bins_packed != capacity).sum())
        
        return -np.mean(num_bins)





