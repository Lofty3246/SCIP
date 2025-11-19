import pickle
import numpy as np
class GetData():
    def __init__(self,n_instance,n_cities):
        self.n_instance = n_instance
        self.n_cities = n_cities
        self.OUTPUT_FILE = '/home/lsy/Desktop/HUAWEI/EoH/examples/tsp_construct/evaluation/trainingdata'
    def generate_instances(self):
        np.random.seed(2024)
        instance_data = []
        for _ in range(self.n_instance):
            coordinates = np.random.rand(self.n_cities, 2)
            distances = np.linalg.norm(coordinates[:, np.newaxis] - coordinates, axis=2)
            instance_data.append((coordinates,distances))
            OUTPUT_FILE = self.OUTPUT_FILE + F'/{self.n_instance}instance_data_' + str(self.n_cities) + 'city.pkl'
        with open(OUTPUT_FILE, 'wb') as f:
            pickle.dump(instance_data, f)
        return instance_data
    def load_instances(self):
        file_path = '/home/lsy/Desktop/HUAWEI/EoH/examples/tsp_construct/evaluation/trainingdata/1000instance_data_'+str(self.n_cities)+'city.pkl'
        print("Loading instances from:", file_path)
        with open(file_path, 'rb') as f:
            data = pickle.load(f)
        return data
# 1000instance_data_20city