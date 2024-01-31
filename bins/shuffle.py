#!/usr/bin/env python

import sys
import random

def main():
    values = []
    for current_line in sys.stdin:
        values.append(current_line.rstrip('\n'))

    shuffled_values = []
    for max_existing in range(len(values)-1, 0, -1):
        index = random.randint(0, max_existing)
        plucked_value = values.pop(index)
        shuffled_values.append(plucked_value)

    for value in shuffled_values:
        print(value)

if __name__ == '__main__':
    main()
