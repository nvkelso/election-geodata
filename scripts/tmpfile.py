#!/usr/bin/env python
from __future__ import print_function
import tempfile, sys
_, prefix, suffix = sys.argv
_, filename = tempfile.mkstemp(prefix=prefix, suffix=suffix)
print(filename)
