#!/usr/bin/env python
import argparse
from collections import defaultdict

parser = argparse.ArgumentParser()
parser.add_argument('input', type=str, help='Colorscheme file to format/validate')

args = parser.parse_args()
colo_file = args.input

LINES_TO_WRITE = []
with open(colo_file) as f:
    for i, line in enumerate(f):
        l = line.rstrip()
        lsplit = l.split()
        if not lsplit:
            LINES_TO_WRITE.append('')
        elif (not lsplit[0].startswith('hi')) and (not lsplit[0].startswith('highlight')):
            LINES_TO_WRITE.append(l)
        else:
            if len(lsplit) < 3:
                raise ValueError(f'FATAL\n')

FIELDS = defaultdict(list)
for l in LINES_TO_WRITE:
    print(l)
        

