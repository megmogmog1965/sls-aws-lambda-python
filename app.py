#!/usr/bin/env python3
import numpy as np

def handler(event: dict, context: dict) -> dict:
    arr1 = np.array([10, 20], dtype=np.int32)
    arr2 = np.array([30, 40], dtype=np.int32)

    return {
        'statusCode': 200,
        'body': str(arr1 + arr2)
    }

if __name__ == '__main__':
    ret = handler({}, {})
    print(ret)
