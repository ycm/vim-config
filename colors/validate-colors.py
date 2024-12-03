#!/usr/bin/env python
import argparse
from collections import defaultdict

parser = argparse.ArgumentParser()
parser.add_argument('input', type=str, help='Colorscheme file to format/validate')

args = parser.parse_args()
colo_file = args.input

def log_error(i, l):
    print('Aborted:')
    raise ValueError(f'\tOn line {i}: {l}')

def pop_field(f, l):
    match = []
    rest = []
    for ll in l:
        if ll.startswith(f):
            match.append(ll)
        else:
            rest.append(ll)
    return match, rest

ATTRS = ('ctermfg=', 'ctermbg=', 'cterm=', 'guifg=', 'guibg=', 'gui=')
LINES_TO_WRITE = []
with open(colo_file) as f:
    for i, line in enumerate(f):
        l = line.rstrip()
        if l == 'hi clear' or l == 'highlight clear':
            LINES_TO_WRITE.append(l)
            continue

        lsplit = l.split()
        if not lsplit:
            LINES_TO_WRITE.append('')
        elif (not lsplit[0].startswith('hi')) and (not lsplit[0].startswith('highlight')):
            LINES_TO_WRITE.append(l)
        else:
            if len(lsplit) < 3:
                log_error(i, l)
            if lsplit[1] == 'link':
                LINES_TO_WRITE.append(lsplit + ['LINK'])
            else:
                cmd, opts_remaining = lsplit[:2], lsplit[2:]
                for attr in ATTRS:
                    val, opts_remaining = pop_field(attr, opts_remaining)
                    if len(val) > 1:
                        log_error(i, l)
                    if val:
                        cmd += val
                    else:
                        cmd += ['']
                # print(cmd)
                LINES_TO_WRITE.append(cmd)

COL_LENS = defaultdict(int)
COL_LENS_LINK = defaultdict(int)
for l in LINES_TO_WRITE:
    if type(l) == list:
        l[0] = l[0].replace('highlight', 'hi')
        if l[-1] == 'LINK':
            for i, c in enumerate(l):
                COL_LENS_LINK[i] = max(COL_LENS_LINK[i], len(c))
        else:
            for i, c in enumerate(l):
                COL_LENS[i] = max(COL_LENS[i], len(c))

with open(colo_file, 'w') as f:
    for l in LINES_TO_WRITE:
        if type(l) == str:
            print(l, file=f)
        else:
            if l[-1] == 'LINK':
                outstr = ' '.join([c.ljust(COL_LENS_LINK[i]) for i, c in enumerate(l[:-1])]).rstrip()
            else:
                outstr = ' '.join([c.ljust(COL_LENS[i]) for i, c in enumerate(l)]).rstrip()
            print(outstr, file=f)
