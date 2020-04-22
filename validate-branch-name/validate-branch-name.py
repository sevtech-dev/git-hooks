#!/usr/bin/env python

import sys, re
from subprocess import check_output

branch = check_output(['git', 'symbolic-ref', '--short', 'HEAD']).strip()
regex = '(feature|bug)\/(\d+)'

if not re.match(regex, branch):
    print('Incorrect branch name')
    sys.exit(1)