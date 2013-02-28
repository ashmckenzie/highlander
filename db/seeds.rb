github_commit = Metric.create(name: 'github_commit', description: 'GitHub commit')
jenkins_green_job = Metric.create(name: 'jenkins_green_job', description: 'Jenkins green job')

github_100_commits = Badge.create(name: '100_github_commits', description: '100 GitHub commits')
github_500_commits = Badge.create(name: '500_github_commits', description: '500 GitHub commits')

user = User.create(email: 'user@example.com')
user.events << Event.create(user: user, metric: github_commit)
user.events << Event.create(user: user, metric: jenkins_green_job)
