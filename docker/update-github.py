#!/usr/bin/env python2.7
from __future__ import print_function
import sys, argparse, json, requests, uritemplate

SUCCESS, PENDING, FAILURE = 'success', 'pending', 'failure'

descriptions = {
    SUCCESS: 'Everything is awesome.',
    PENDING: 'Working on it...',
    FAILURE: 'Argh.'
    }

parser = argparse.ArgumentParser(description='Tell Github how it is.')

parser.add_argument('repo_url', help='Github repository URL')
parser.add_argument('sha', help='Git commit SHA')
parser.add_argument('token', help='Github token')
parser.add_argument('state', help='Github status state', choices=(SUCCESS, PENDING, FAILURE))
parser.add_argument('--url', help='Github status target URL')

args = parser.parse_args()

if __name__ == '__main__':
    auth = (args.token, 'x-oauth-basic')
    repo_info = requests.get(args.repo_url, auth=auth).json()
    statuses_url = uritemplate.expand(repo_info.get('statuses_url'), sha=args.sha)
    commits_url = uritemplate.expand(repo_info.get('commits_url'), sha=args.sha)
    pulls_url = uritemplate.expand(repo_info.get('pulls_url'))

    print(statuses_url, commits_url)
    
    status = dict(state=args.state, description=descriptions[args.state], context='elections')
    if args.url:
        status.update(target_url=args.url)
    resp1 = requests.post(statuses_url, auth=auth, data=json.dumps(status))
    
    if resp1.status_code not in range(200, 299):
        raise Exception('{} response for status update: {}'.format(resp1.status_code, resp1.text))
    
    for pull_info in requests.get(pulls_url, auth=auth).json():
        if pull_info['head']['sha'] != args.sha:
            continue

        print(pull_info.keys())
        print(pull_info['comments_url'])
        print(pull_info['issue_url'])
        
        comments_url = pull_info['comments_url']
        comment = dict(body='Testing in code')
        resp2 = requests.post(comments_url, auth=auth, data=json.dumps(comment))
    
        if resp2.status_code not in range(200, 299):
            print('{} response for comment post: {}'.format(resp2.status_code, resp2.text), file=sys.stderr)
