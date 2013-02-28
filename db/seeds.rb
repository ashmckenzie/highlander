github_commit = Metric.create(name: 'github_commit', description: 'GitHub commit')
jenkins_green_job = Metric.create(name: 'jenkins_green_job', description: 'Jenkins green job')

user = User.create(email: 'user@example.com')
user.events << Event.create(metric: github_commit)
user.events << Event.create(metric: jenkins_green_job)
