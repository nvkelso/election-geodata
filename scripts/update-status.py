#!/usr/bin/env python2
from __future__ import print_function
import os, sys, requests, json

_, target_url = sys.argv
auth = os.environ['GITHUB_TOKEN'], 'x-oauth-basic'
env = [os.environ[key] for key in ('GITHUB_USERNAME', 'GITHUB_REPONAME', 'GIT_SHA1')]
post_url = 'https://api.github.com/repos/{0}/{1}/commits/{2}/statuses'.format(*env)
post_data = dict(state="success", context="elections", target_url=target_url, description="Everything is awesome")
post_body = json.dumps(post_data)

resp = requests.post(post_url, post_body, auth=auth)

if resp.status_code not in range(200, 299):
    print(resp.text, file=sys.stderr)
    exit(1)
