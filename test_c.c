#include <Python.h>
#include <stdio.h>

int main() {
    // 初始化 Python 解释器
    printf("hello\n");
    Py_Initialize();
    
    if (!Py_IsInitialized()) {
        fprintf(stderr, "Failed to initialize Python\n");
        return 1;
    }

    // 执行一段 Python 代码
    PyObject *pName, *pModule,*pFunc;
        PyObject *pArgs = NULL;
    PyObject *pValue = NULL;
    pArgs = PyTuple_New(0);  // 创建空元组

    PyRun_SimpleString("import sys");
    PyRun_SimpleString("import sys");
    PyRun_SimpleString("sys.path.append('/home/lsy/Desktop/HUAWEI/exp_scip')"); // Current directory
    char name[128] = "func_helper";
    char moduleName[128] = "myheurdiving_helper";
    // pName = PyUnicode_DecodeFSDefault(name);
    pModule = PyImport_ImportModule(name);
    PyRun_SimpleString("print('Hello from embedded Python!')"); 
    pFunc = PyObject_GetAttrString(pModule, moduleName);
if (pFunc && PyCallable_Check(pFunc)) {
        printf("Found function: getcwd\n");
        // 可以调用它（需要使用 PyObject_CallObject）
        // 使用 PyObject_Call()，支持关键字参数
pValue = PyObject_CallObject(pFunc, pArgs);
    } else {
        printf("Function 'getcwd' not found or not callable\n");
    }

    // 5. 清理引用（重要！避免内存泄漏）
    Py_XDECREF(pFunc);      // 可能为 NULL，用 XDECREF
    Py_DECREF(pModule);     // 模块引用必须释放
    // 清理
    Py_Finalize();
    return 0;
}