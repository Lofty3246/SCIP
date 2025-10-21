#!/usr/bin/env python3
"""
PySCIPOpt 导入问题诊断脚本
"""

import sys
import os
import importlib

sys.path.append('/home/lsy/anaconda3/envs/env1/lib/python3.11/site-packages')

def check_environment():
    print("=== 环境检查 ===")
    print(f"Python: {sys.version}")
    print(f"Platform: {sys.platform}")
    print(f"SCIPOPTDIR: {os.getenv('SCIPOPTDIR', '未设置')}")
    
    if os.getenv('SCIPOPTDIR'):
        scip_dir = os.getenv('SCIPOPTDIR')
        print(f"SCIP目录内容: {os.listdir(scip_dir)}")

def check_pyscipopt_installation():
    print("\n=== PySCIPOpt 安装检查 ===")
    try:
        import pyscipopt
        print(f"✓ PySCIPOpt 包位置: {pyscipopt.__file__}")
        
        # 检查包目录内容
        pkg_dir = os.path.dirname(pyscipopt.__file__)
        if os.path.exists(pkg_dir):
            print(f"包目录内容: {os.listdir(pkg_dir)}")
        
        return True
    except ImportError as e:
        print(f"✗ 无法导入 PySCIPOpt: {e}")
        return False

def check_scip_module():
    print("\n=== SCIP 模块检查 ===")
    try:
        from pyscipopt import scip
        print(f"✓ SCIP 模块位置: {scip.__file__}")
        return True
    except ImportError as e:
        print(f"✗ 无法导入 pyscipopt.scip: {e}")
        return False

def check_dependencies():
    print("\n=== 依赖库检查 ===")
    import ctypes
    import sys
    
    libraries = []
    if sys.platform.startswith('win'):
        libraries = ['scip.dll', 'soplex.dll']
    else:
        libraries = ['libscip.so', 'libsoplex.so']
    
    for lib in libraries:
        try:
            ctypes.CDLL(lib)
            print(f"✓ 找到库: {lib}")
        except OSError:
            print(f"✗ 未找到库: {lib}")

def main():
    print("PySCIPOpt 导入问题诊断")
    print("=" * 50)
    
    check_environment()
    if check_pyscipopt_installation():
        check_scip_module()
    check_dependencies()
    
    print("\n=== 建议 ===")
    if not os.getenv('SCIPOPTDIR'):
        print("1. 设置 SCIPOPTDIR 环境变量")
    print("2. 确保 SCIP 库在系统路径中")
    print("3. 尝试重新安装 PySCIPOpt: pip install --force-reinstall pyscipopt")

if __name__ == "__main__":
    main()