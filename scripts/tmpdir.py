#!/usr/bin/env python
from __future__ import print_function
import tempfile, sys
_, prefix = sys.argv
dirname = tempfile.mkdtemp(prefix=prefix)
print(dirname)
