from git import Repo
import sys

OFFICIAL_UPSTREAM_REPO = sys.argv[1]
ACTIVE_BRANCH_NAME = sys.argv[2]

repo = Repo.init()
origin = repo.create_remote("temponame", OFFICIAL_UPSTREAM_REPO)
origin.fetch()
repo.create_head(ACTIVE_BRANCH_NAME, origin.refs[ACTIVE_BRANCH_NAME])
repo.heads[ACTIVE_BRANCH_NAME].checkout(True)
