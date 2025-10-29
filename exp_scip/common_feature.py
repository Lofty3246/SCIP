# 自动加载 .lp 文件
# 提取特征
# 构建 instances 列表
# 用于你的 evaluate 函数
# feature_extractor.py

import os
import glob
import json
import numpy as np
from typing import List, Dict, Any
from pyscipopt import Model
import pyscipopt as scip



class FeatureExtractor:
    def __init__(self):
        self.feature_names = [
            'mayrounddown', 'mayroundup', 'candsfrac', 'candsol',
            'nlocksdown', 'nlocksup', 'obj', 'objnorm',
            'pscostdown', 'pscostup', 'rootsolval', 'nNonz', 'isBinary'
        ]

    def extract(self, model: scip.Model) -> List[Dict[str, float]]:
        features_list = []
        candidate_vars = [
            var for var in model.getVars()
            if var.vtype() in ('BINARY', 'INTEGER')
        ]

        # 确保运行到 root node
        if model.getNNodes() == 0:
            model.optimize()  # 触发求解到 root

        try:
            root_obj = model.getRootObjval()
        except:
            root_obj = 1.0
        obj_norm_factor = max(1e-6, abs(root_obj))

        for var in candidate_vars:
            sol = model.getSolVal(var)

            # 跳过已整数解的变量
            if abs(round(sol) - sol) < 1e-6:
                continue

            feat = {
                'mayrounddown': 1.0 if sol > 1e-6 else 0.0,
                'mayroundup':   1.0 if sol < (var.getUbGlobal() - 1e-6) else 0.0,
                'candsfrac':    1.0,
                'candsol':      float(sol),
                'nlocksdown':   float(model.getVarLocksDown(var)),
                'nlocksup':     float(model.getVarLocksUp(var)),
                'obj':          float(var.getObj()),
                'objnorm':      float(abs(var.getObj()) / obj_norm_factor),
                'pscostdown':   float(var.getPseudoCost(False)),
                'pscostup':     float(var.getPseudoCost(True)),
                'rootsolval':   float(root_obj),
                'nNonz':        float(len([v for v in model.getVars() if abs(model.getSolVal(v)) > 1e-6])),
                'isBinary':     1.0 if model.getVartype(var) == scip.VAR_TYPE.BINARY else 0.0
            }

            features_list.append(feat)

        return features_list

    def load_and_extract_from_file(self, lp_file: str) -> List[Dict[str, float]]:
        """加载 .lp 文件并提取特征"""
        try:
            model = Model()
            model.hideOutput()  # 不打印求解过程
            model.readProblem(lp_file)
            
            print(f"Loaded {lp_file} | n_vars: {model.getNVars()} | n_conss: {model.getNConss()}")
            
            # 提取
            features = self.extract(model)
            print(f"  → Extracted {len(features)} candidate variables\n")
            
            return features
        
        
        except Exception as e:
            print(f"Error loading {lp_file}: {e}")
            return []

    def extract_from_directory(self, lp_dir: str, output_pkl: str = None) -> List[Dict[str, float]]:
        """
        从目录中所有 .lp 文件提取特征
        
        Args:
            lp_dir: 包含 .lp 文件的目录
            output_pkl: 可选，保存提取结果的路径
        
        Returns:
            所有实例的特征列表（可用于 evaluate 函数）
        """
        all_features = []
        lp_files = sorted(glob.glob(os.path.join(lp_dir, "*.lp")))
        
        if not lp_files:
            raise FileNotFoundError(f"No .lp files found in {lp_dir}")
        
        
        for lp_file in lp_files:
            feats = self.load_and_extract_from_file(lp_file)
            all_features.extend(feats)  # 合并所有变量特征
                
        if output_pkl:
            with open(output_pkl, 'w') as f:
                json.dump(all_features, f, indent=5)
                print(f"Features saved to {output_pkl}")

        return all_features



if __name__ == "__main__":
    
    extractor = FeatureExtractor()
    
    # 设置你的 .lp 文件目录
    LP_DIR = "/home/lsy/Desktop/HUAWEI/data/ca"          # 修改为你的路径
    OUTPUT_PKL = "/home/lsy/Desktop/HUAWEI/exp_scip/instances.json"  # 修改为你的路径
    
    # 提取特征
    instances = extractor.extract_from_directory(LP_DIR, OUTPUT_PKL)
    