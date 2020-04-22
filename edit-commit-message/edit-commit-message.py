#!/usr/bin/env python

import sys, re
from subprocess import check_output

commit_msg_filepath = sys.argv[1]
branch = check_output(['git', 'symbolic-ref', '--short', 'HEAD']).strip()
regex = '(feature|bug)\/(\d+)'

issue = re.match(regex, branch).group(2)
with open(commit_msg_filepath, 'r+') as fh:
    commit_msg = fh.read()
    fh.seek(0, 0)
    fh.write('[%s] %s' % (issue, commit_msg))