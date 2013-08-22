class GithubPayloads

  def self.push(email)
    <<-JSON
      {
        "after":"24f2a159117298d4d8a7bd06d4a2ed2e668b0b45",
        "before":"23080a520c9891706d43de9b233eeb32a9105d04",
        "commits":[
          {
             "added":[

             ],
             "author":{
                "email":"#{email}",
                "name":"Stuart Liston",
                "username":"stuliston"
             },
             "committer":{
                "email":"#{email}",
                "name":"Stuart Liston",
                "username":"stuliston"
             },
             "distinct":true,
             "id":"47f3eaaadcb2097edf9c2f42dd3cef2cd407fa47",
             "message":"[flight bookers] Andrei and I added api for loggedy logging at the levels in a similar fashion to the rails logger",
             "modified":[
                "lib/loggedy/logger.rb",
                "spec/lib/loggedy/logger_spec.rb"
             ],
             "removed":[

             ],
             "timestamp":"2013-04-11T22:33:55-07:00",
             "url":"https://github.com/hooroo/hotels/commit/47f3eaaadcb2097edf9c2f42dd3cef2cd407fa47"
          },
          {
             "added":[

             ],
             "author":{
                "email":"tim@hooroo.com",
                "name":"Timothy Dang",
                "username":"timothydang"
             },
             "committer":{
                "email":"tim@hooroo.com",
                "name":"Timothy Dang",
                "username":"timothydang"
             },
             "distinct":true,
             "id":"5ec619dedca09d72d4fd62f51dc7d2fe2fb0f158",
             "message":"[Flightbookers] Styling update to normal property cards on search page for consistency",
             "modified":[
                "app/assets/stylesheets/consumer/skin/jetstar/list/list.css.sass",
                "app/assets/stylesheets/consumer/skin/jetstar/search/embeddable_search.css.sass"
             ],
             "removed":[

             ],
             "timestamp":"2013-04-11T22:45:31-07:00",
             "url":"https://github.com/hooroo/hotels/commit/5ec619dedca09d72d4fd62f51dc7d2fe2fb0f158"
          },
          {
             "added":[

             ],
             "author":{
                "email":"lusu777@gmail.com",
                "name":"Andrei Miulescu",
                "username":"andrei-miulescu"
             },
             "committer":{
                "email":"lusu777@gmail.com",
                "name":"Andrei Miulescu",
                "username":"andrei-miulescu"
             },
             "distinct":true,
             "id":"24f2a159117298d4d8a7bd06d4a2ed2e668b0b45",
             "message":"[Flight Bookers] Excluded jetstar customers from responsys mailing list",
             "modified":[
                "app/models/customer.rb",
                "spec/models/customer_spec.rb"
             ],
             "removed":[

             ],
             "timestamp":"2013-04-11T22:51:26-07:00",
             "url":"https://github.com/hooroo/hotels/commit/24f2a159117298d4d8a7bd06d4a2ed2e668b0b45"
          }
        ],
        "compare":"https://github.com/hooroo/hotels/compare/23080a520c98...24f2a1591172",
        "created":false,
        "deleted":false,
        "forced":false,
        "head_commit":{
        "added":[

        ],
        "author":{
           "email":"lusu777@gmail.com",
           "name":"Andrei Miulescu",
           "username":"andrei-miulescu"
        },
        "committer":{
           "email":"lusu777@gmail.com",
           "name":"Andrei Miulescu",
           "username":"andrei-miulescu"
        },
        "distinct":true,
        "id":"24f2a159117298d4d8a7bd06d4a2ed2e668b0b45",
        "message":"[Flight Bookers] Excluded jetstar customers from responsys mailing list",
        "modified":[
           "app/models/customer.rb",
           "spec/models/customer_spec.rb"
        ],
        "removed":[

        ],
        "timestamp":"2013-04-11T22:51:26-07:00",
        "url":"https://github.com/hooroo/hotels/commit/24f2a159117298d4d8a7bd06d4a2ed2e668b0b45"
        },
        "pusher":{
          "name":"none"
        },
        "ref":"refs/heads/master",
        "repository":{
          "created_at":1305593978,
          "description":"Hooroo, Qantas and Jetstar hotel sites",
          "fork":false,
          "forks":0,
          "has_downloads":true,
          "has_issues":true,
          "has_wiki":true,
          "homepage":"http://hooroo.com",
          "id":1758526,
          "language":"Ruby",
          "master_branch":"master",
          "name":"hotels",
          "open_issues":4,
          "organization":"hooroo",
          "owner":{
             "email":null,
             "name":"hooroo"
          },
          "private":true,
          "pushed_at":1365752461,
          "size":122236,
          "stargazers":2,
          "url":"https://github.com/hooroo/hotels",
          "watchers":2
        }
      }
    JSON
  end

  # Created this hook using:
  # curl -i --user stuliston -X POST -d '{"name": "web", "events": ["issues"], "active": true, "config": {"url": "https://thequickening.herokuapp.com/api/github_issue_opened.json", "content_type": "json"}}' https://api.github.com/repos/hooroo/chef-repo/hooks
  def self.issue_opened(github_username)
    JSON.parse(
    <<-JSON
      {
        "action": "opened",
        "issue": {
          "assignee": {
            "avatar_url": "https://secure.gravatar.com/avatar/dae3715f6eae05308ff8bd57b1618b2b?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
            "events_url": "https://api.github.com/users/stuliston/events{/privacy}",
            "followers_url": "https://api.github.com/users/stuliston/followers",
            "following_url": "https://api.github.com/users/stuliston/following",
            "gists_url": "https://api.github.com/users/stuliston/gists{/gist_id}",
            "gravatar_id": "dae3715f6eae05308ff8bd57b1618b2b",
            "html_url": "https://github.com/stuliston",
            "id": 323187,
            "login": "stuliston",
            "organizations_url": "https://api.github.com/users/stuliston/orgs",
            "received_events_url": "https://api.github.com/users/stuliston/received_events",
            "repos_url": "https://api.github.com/users/stuliston/repos",
            "starred_url": "https://api.github.com/users/stuliston/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/stuliston/subscriptions",
            "type": "User",
            "url": "https://api.github.com/users/stuliston"
          },
          "body": "Some content",
          "closed_at": null,
          "comments": 0,
          "comments_url": "https://api.github.com/repos/stuliston/expressyaself/issues/2/comments",
          "created_at": "2013-04-13T12:32:03Z",
          "events_url": "https://api.github.com/repos/stuliston/expressyaself/issues/2/events",
          "html_url": "https://github.com/stuliston/expressyaself/issues/2",
          "id": 13155630,
          "labels": [
            {
              "color": "84b6eb",
              "name": "enhancement",
              "url": "https://api.github.com/repos/stuliston/expressyaself/labels/enhancement"
            },
            {
              "color": "cc317c",
              "name": "question",
              "url": "https://api.github.com/repos/stuliston/expressyaself/labels/question"
            }
          ],
          "labels_url": "https://api.github.com/repos/stuliston/expressyaself/issues/2/labels{/name}",
          "milestone": null,
          "number": 2,
          "pull_request": {
            "diff_url": null,
            "html_url": null,
            "patch_url": null
          },
          "state": "open",
          "title": "Test issue - please ignore",
          "updated_at": "2013-04-13T12:32:03Z",
          "url": "https://api.github.com/repos/stuliston/expressyaself/issues/2",
          "user": {
            "avatar_url": "https://secure.gravatar.com/avatar/dae3715f6eae05308ff8bd57b1618b2b?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
            "events_url": "https://api.github.com/users/stuliston/events{/privacy}",
            "followers_url": "https://api.github.com/users/stuliston/followers",
            "following_url": "https://api.github.com/users/stuliston/following",
            "gists_url": "https://api.github.com/users/stuliston/gists{/gist_id}",
            "gravatar_id": "dae3715f6eae05308ff8bd57b1618b2b",
            "html_url": "https://github.com/stuliston",
            "id": 323187,
            "login": "#{github_username}",
            "organizations_url": "https://api.github.com/users/stuliston/orgs",
            "received_events_url": "https://api.github.com/users/stuliston/received_events",
            "repos_url": "https://api.github.com/users/stuliston/repos",
            "starred_url": "https://api.github.com/users/stuliston/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/stuliston/subscriptions",
            "type": "User",
            "url": "https://api.github.com/users/stuliston"
          }
        },
        "repository": {
          "archive_url": "https://api.github.com/repos/stuliston/expressyaself/{archive_format}{/ref}",
          "assignees_url": "https://api.github.com/repos/stuliston/expressyaself/assignees{/user}",
          "blobs_url": "https://api.github.com/repos/stuliston/expressyaself/git/blobs{/sha}",
          "branches_url": "https://api.github.com/repos/stuliston/expressyaself/branches{/branch}",
          "clone_url": "https://github.com/stuliston/expressyaself.git",
          "collaborators_url": "https://api.github.com/repos/stuliston/expressyaself/collaborators{/collaborator}",
          "comments_url": "https://api.github.com/repos/stuliston/expressyaself/comments{/number}",
          "commits_url": "https://api.github.com/repos/stuliston/expressyaself/commits{/sha}",
          "compare_url": "https://api.github.com/repos/stuliston/expressyaself/compare/{base}...{head}",
          "contents_url": "https://api.github.com/repos/stuliston/expressyaself/contents/{+path}",
          "contributors_url": "https://api.github.com/repos/stuliston/expressyaself/contributors",
          "created_at": "2013-03-07T02:49:40Z",
          "default_branch": "master",
          "description": "Gmail-backed noticed board where emails with hash-tagged subject-lines are displayed scraped and displayed",
          "downloads_url": "https://api.github.com/repos/stuliston/expressyaself/downloads",
          "events_url": "https://api.github.com/repos/stuliston/expressyaself/events",
          "fork": false,
          "forks": 0,
          "forks_count": 0,
          "forks_url": "https://api.github.com/repos/stuliston/expressyaself/forks",
          "full_name": "stuliston/expressyaself",
          "git_commits_url": "https://api.github.com/repos/stuliston/expressyaself/git/commits{/sha}",
          "git_refs_url": "https://api.github.com/repos/stuliston/expressyaself/git/refs{/sha}",
          "git_tags_url": "https://api.github.com/repos/stuliston/expressyaself/git/tags{/sha}",
          "git_url": "git://github.com/stuliston/expressyaself.git",
          "has_downloads": true,
          "has_issues": true,
          "has_wiki": true,
          "homepage": null,
          "hooks_url": "https://api.github.com/repos/stuliston/expressyaself/hooks",
          "html_url": "https://github.com/stuliston/expressyaself",
          "id": 8618655,
          "issue_comment_url": "https://api.github.com/repos/stuliston/expressyaself/issues/comments/{number}",
          "issue_events_url": "https://api.github.com/repos/stuliston/expressyaself/issues/events{/number}",
          "issues_url": "https://api.github.com/repos/stuliston/expressyaself/issues{/number}",
          "keys_url": "https://api.github.com/repos/stuliston/expressyaself/keys{/key_id}",
          "labels_url": "https://api.github.com/repos/stuliston/expressyaself/labels{/name}",
          "language": "Ruby",
          "languages_url": "https://api.github.com/repos/stuliston/expressyaself/languages",
          "master_branch": "master",
          "merges_url": "https://api.github.com/repos/stuliston/expressyaself/merges",
          "milestones_url": "https://api.github.com/repos/stuliston/expressyaself/milestones{/number}",
          "mirror_url": null,
          "name": "expressyaself",
          "notifications_url": "https://api.github.com/repos/stuliston/expressyaself/notifications{?since,all,participating}",
          "open_issues": 1,
          "open_issues_count": 1,
          "owner": {
            "avatar_url": "https://secure.gravatar.com/avatar/dae3715f6eae05308ff8bd57b1618b2b?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
            "events_url": "https://api.github.com/users/stuliston/events{/privacy}",
            "followers_url": "https://api.github.com/users/stuliston/followers",
            "following_url": "https://api.github.com/users/stuliston/following",
            "gists_url": "https://api.github.com/users/stuliston/gists{/gist_id}",
            "gravatar_id": "dae3715f6eae05308ff8bd57b1618b2b",
            "html_url": "https://github.com/stuliston",
            "id": 323187,
            "login": "stuliston",
            "organizations_url": "https://api.github.com/users/stuliston/orgs",
            "received_events_url": "https://api.github.com/users/stuliston/received_events",
            "repos_url": "https://api.github.com/users/stuliston/repos",
            "starred_url": "https://api.github.com/users/stuliston/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/stuliston/subscriptions",
            "type": "User",
            "url": "https://api.github.com/users/stuliston"
          },
          "private": false,
          "pulls_url": "https://api.github.com/repos/stuliston/expressyaself/pulls{/number}",
          "pushed_at": "2013-03-19T13:38:39Z",
          "size": 1536,
          "ssh_url": "git@github.com:stuliston/expressyaself.git",
          "stargazers_url": "https://api.github.com/repos/stuliston/expressyaself/stargazers",
          "statuses_url": "https://api.github.com/repos/stuliston/expressyaself/statuses/{sha}",
          "subscribers_url": "https://api.github.com/repos/stuliston/expressyaself/subscribers",
          "subscription_url": "https://api.github.com/repos/stuliston/expressyaself/subscription",
          "svn_url": "https://github.com/stuliston/expressyaself",
          "tags_url": "https://api.github.com/repos/stuliston/expressyaself/tags{/tag}",
          "teams_url": "https://api.github.com/repos/stuliston/expressyaself/teams",
          "trees_url": "https://api.github.com/repos/stuliston/expressyaself/git/trees{/sha}",
          "updated_at": "2013-03-19T13:38:40Z",
          "url": "https://api.github.com/repos/stuliston/expressyaself",
          "watchers": 0,
          "watchers_count": 0
        },
        "sender": {
          "avatar_url": "https://secure.gravatar.com/avatar/dae3715f6eae05308ff8bd57b1618b2b?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
          "events_url": "https://api.github.com/users/stuliston/events{/privacy}",
          "followers_url": "https://api.github.com/users/stuliston/followers",
          "following_url": "https://api.github.com/users/stuliston/following",
          "gists_url": "https://api.github.com/users/stuliston/gists{/gist_id}",
          "gravatar_id": "dae3715f6eae05308ff8bd57b1618b2b",
          "html_url": "https://github.com/stuliston",
          "id": 323187,
          "login": "stuliston",
          "organizations_url": "https://api.github.com/users/stuliston/orgs",
          "received_events_url": "https://api.github.com/users/stuliston/received_events",
          "repos_url": "https://api.github.com/users/stuliston/repos",
          "starred_url": "https://api.github.com/users/stuliston/starred{/owner}{/repo}",
          "subscriptions_url": "https://api.github.com/users/stuliston/subscriptions",
          "type": "User",
          "url": "https://api.github.com/users/stuliston"
        }
      }
    JSON
    )
  end

  # Created this hook using:
  # curl -i --user stuliston -X POST -d '{"name": "web", "events": ["issues"], "active": true, "config": {"url": "https://thequickening.herokuapp.com/api/github_issue_closed.json", "content_type": "json"}}' https://api.github.com/repos/hooroo/chef-repo/hooks
  def self.issue_closed(github_username)
    JSON.parse(
    <<-JSON
      {
        "action": "closed",
        "issue": {
          "assignee": {
            "avatar_url": "https://secure.gravatar.com/avatar/dae3715f6eae05308ff8bd57b1618b2b?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
            "events_url": "https://api.github.com/users/stuliston/events{/privacy}",
            "followers_url": "https://api.github.com/users/stuliston/followers",
            "following_url": "https://api.github.com/users/stuliston/following",
            "gists_url": "https://api.github.com/users/stuliston/gists{/gist_id}",
            "gravatar_id": "dae3715f6eae05308ff8bd57b1618b2b",
            "html_url": "https://github.com/stuliston",
            "id": 323187,
            "login": "#{github_username}",
            "organizations_url": "https://api.github.com/users/stuliston/orgs",
            "received_events_url": "https://api.github.com/users/stuliston/received_events",
            "repos_url": "https://api.github.com/users/stuliston/repos",
            "starred_url": "https://api.github.com/users/stuliston/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/stuliston/subscriptions",
            "type": "User",
            "url": "https://api.github.com/users/stuliston"
          },
          "body": "Some content",
          "closed_at": "2013-04-13T12:33:35Z",
          "comments": 1,
          "comments_url": "https://api.github.com/repos/stuliston/expressyaself/issues/2/comments",
          "created_at": "2013-04-13T12:32:03Z",
          "events_url": "https://api.github.com/repos/stuliston/expressyaself/issues/2/events",
          "html_url": "https://github.com/stuliston/expressyaself/issues/2",
          "id": 13155630,
          "labels": [
            {
              "color": "84b6eb",
              "name": "enhancement",
              "url": "https://api.github.com/repos/stuliston/expressyaself/labels/enhancement"
            },
            {
              "color": "cc317c",
              "name": "question",
              "url": "https://api.github.com/repos/stuliston/expressyaself/labels/question"
            }
          ],
          "labels_url": "https://api.github.com/repos/stuliston/expressyaself/issues/2/labels{/name}",
          "milestone": null,
          "number": 2,
          "pull_request": {
            "diff_url": null,
            "html_url": null,
            "patch_url": null
          },
          "state": "closed",
          "title": "Test issue - please ignore",
          "updated_at": "2013-04-13T12:33:35Z",
          "url": "https://api.github.com/repos/stuliston/expressyaself/issues/2",
          "user": {
            "avatar_url": "https://secure.gravatar.com/avatar/dae3715f6eae05308ff8bd57b1618b2b?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
            "events_url": "https://api.github.com/users/stuliston/events{/privacy}",
            "followers_url": "https://api.github.com/users/stuliston/followers",
            "following_url": "https://api.github.com/users/stuliston/following",
            "gists_url": "https://api.github.com/users/stuliston/gists{/gist_id}",
            "gravatar_id": "dae3715f6eae05308ff8bd57b1618b2b",
            "html_url": "https://github.com/stuliston",
            "id": 323187,
            "login": "#{github_username}",
            "organizations_url": "https://api.github.com/users/stuliston/orgs",
            "received_events_url": "https://api.github.com/users/stuliston/received_events",
            "repos_url": "https://api.github.com/users/stuliston/repos",
            "starred_url": "https://api.github.com/users/stuliston/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/stuliston/subscriptions",
            "type": "User",
            "url": "https://api.github.com/users/stuliston"
          }
        },
        "repository": {
          "archive_url": "https://api.github.com/repos/stuliston/expressyaself/{archive_format}{/ref}",
          "assignees_url": "https://api.github.com/repos/stuliston/expressyaself/assignees{/user}",
          "blobs_url": "https://api.github.com/repos/stuliston/expressyaself/git/blobs{/sha}",
          "branches_url": "https://api.github.com/repos/stuliston/expressyaself/branches{/branch}",
          "clone_url": "https://github.com/stuliston/expressyaself.git",
          "collaborators_url": "https://api.github.com/repos/stuliston/expressyaself/collaborators{/collaborator}",
          "comments_url": "https://api.github.com/repos/stuliston/expressyaself/comments{/number}",
          "commits_url": "https://api.github.com/repos/stuliston/expressyaself/commits{/sha}",
          "compare_url": "https://api.github.com/repos/stuliston/expressyaself/compare/{base}...{head}",
          "contents_url": "https://api.github.com/repos/stuliston/expressyaself/contents/{+path}",
          "contributors_url": "https://api.github.com/repos/stuliston/expressyaself/contributors",
          "created_at": "2013-03-07T02:49:40Z",
          "default_branch": "master",
          "description": "Gmail-backed noticed board where emails with hash-tagged subject-lines are displayed scraped and displayed",
          "downloads_url": "https://api.github.com/repos/stuliston/expressyaself/downloads",
          "events_url": "https://api.github.com/repos/stuliston/expressyaself/events",
          "fork": false,
          "forks": 0,
          "forks_count": 0,
          "forks_url": "https://api.github.com/repos/stuliston/expressyaself/forks",
          "full_name": "stuliston/expressyaself",
          "git_commits_url": "https://api.github.com/repos/stuliston/expressyaself/git/commits{/sha}",
          "git_refs_url": "https://api.github.com/repos/stuliston/expressyaself/git/refs{/sha}",
          "git_tags_url": "https://api.github.com/repos/stuliston/expressyaself/git/tags{/sha}",
          "git_url": "git://github.com/stuliston/expressyaself.git",
          "has_downloads": true,
          "has_issues": true,
          "has_wiki": true,
          "homepage": null,
          "hooks_url": "https://api.github.com/repos/stuliston/expressyaself/hooks",
          "html_url": "https://github.com/stuliston/expressyaself",
          "id": 8618655,
          "issue_comment_url": "https://api.github.com/repos/stuliston/expressyaself/issues/comments/{number}",
          "issue_events_url": "https://api.github.com/repos/stuliston/expressyaself/issues/events{/number}",
          "issues_url": "https://api.github.com/repos/stuliston/expressyaself/issues{/number}",
          "keys_url": "https://api.github.com/repos/stuliston/expressyaself/keys{/key_id}",
          "labels_url": "https://api.github.com/repos/stuliston/expressyaself/labels{/name}",
          "language": "Ruby",
          "languages_url": "https://api.github.com/repos/stuliston/expressyaself/languages",
          "master_branch": "master",
          "merges_url": "https://api.github.com/repos/stuliston/expressyaself/merges",
          "milestones_url": "https://api.github.com/repos/stuliston/expressyaself/milestones{/number}",
          "mirror_url": null,
          "name": "expressyaself",
          "notifications_url": "https://api.github.com/repos/stuliston/expressyaself/notifications{?since,all,participating}",
          "open_issues": 0,
          "open_issues_count": 0,
          "owner": {
            "avatar_url": "https://secure.gravatar.com/avatar/dae3715f6eae05308ff8bd57b1618b2b?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
            "events_url": "https://api.github.com/users/stuliston/events{/privacy}",
            "followers_url": "https://api.github.com/users/stuliston/followers",
            "following_url": "https://api.github.com/users/stuliston/following",
            "gists_url": "https://api.github.com/users/stuliston/gists{/gist_id}",
            "gravatar_id": "dae3715f6eae05308ff8bd57b1618b2b",
            "html_url": "https://github.com/stuliston",
            "id": 323187,
            "login": "#{github_username}",
            "organizations_url": "https://api.github.com/users/stuliston/orgs",
            "received_events_url": "https://api.github.com/users/stuliston/received_events",
            "repos_url": "https://api.github.com/users/stuliston/repos",
            "starred_url": "https://api.github.com/users/stuliston/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/stuliston/subscriptions",
            "type": "User",
            "url": "https://api.github.com/users/stuliston"
          },
          "private": false,
          "pulls_url": "https://api.github.com/repos/stuliston/expressyaself/pulls{/number}",
          "pushed_at": "2013-03-19T13:38:39Z",
          "size": 1536,
          "ssh_url": "git@github.com:stuliston/expressyaself.git",
          "stargazers_url": "https://api.github.com/repos/stuliston/expressyaself/stargazers",
          "statuses_url": "https://api.github.com/repos/stuliston/expressyaself/statuses/{sha}",
          "subscribers_url": "https://api.github.com/repos/stuliston/expressyaself/subscribers",
          "subscription_url": "https://api.github.com/repos/stuliston/expressyaself/subscription",
          "svn_url": "https://github.com/stuliston/expressyaself",
          "tags_url": "https://api.github.com/repos/stuliston/expressyaself/tags{/tag}",
          "teams_url": "https://api.github.com/repos/stuliston/expressyaself/teams",
          "trees_url": "https://api.github.com/repos/stuliston/expressyaself/git/trees{/sha}",
          "updated_at": "2013-03-19T13:38:40Z",
          "url": "https://api.github.com/repos/stuliston/expressyaself",
          "watchers": 0,
          "watchers_count": 0
        },
        "sender": {
          "avatar_url": "https://secure.gravatar.com/avatar/dae3715f6eae05308ff8bd57b1618b2b?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
          "events_url": "https://api.github.com/users/stuliston/events{/privacy}",
          "followers_url": "https://api.github.com/users/stuliston/followers",
          "following_url": "https://api.github.com/users/stuliston/following",
          "gists_url": "https://api.github.com/users/stuliston/gists{/gist_id}",
          "gravatar_id": "dae3715f6eae05308ff8bd57b1618b2b",
          "html_url": "https://github.com/stuliston",
          "id": 323187,
          "login": "#{github_username}",
          "organizations_url": "https://api.github.com/users/stuliston/orgs",
          "received_events_url": "https://api.github.com/users/stuliston/received_events",
          "repos_url": "https://api.github.com/users/stuliston/repos",
          "starred_url": "https://api.github.com/users/stuliston/starred{/owner}{/repo}",
          "subscriptions_url": "https://api.github.com/users/stuliston/subscriptions",
          "type": "User",
          "url": "https://api.github.com/users/stuliston"
        }
      }
    JSON
    )
  end

end
