#!/usr/bin/env python2
from __future__ import print_function
import os, sys, requests, json, base64, urlparse
_, target_url = sys.argv
auth = os.environ['GITHUB_TOKEN'], 'x-oauth-basic'
env = [os.environ[key] for key in ('CIRCLE_PROJECT_USERNAME', 'CIRCLE_PROJECT_REPONAME', 'CIRCLE_SHA1')]
post_url = 'https://api.github.com/repos/{0}/{1}/commits/{2}/statuses'.format(*env)
post_data = dict(state="success", context="elections", target_url=target_url, description="Everything is awesomer")
post_body = json.dumps(post_data)

scheme, hostname, path, _, _, _ = urlparse.urlparse(post_url)
print('Authorization: Basic {}'.format(base64.b64encode(':'.join(auth))))
print(post_url)
print(scheme, hostname, path)
print(post_body)
print(requests.post(post_url, post_body, auth=auth))
