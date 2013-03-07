Metric.create(name: 'github_commit', description: 'GitHub commit')
Metric.create(name: 'jenkins_green_job', description: 'Jenkins green job')
Metric.create(name: 'ming_pong_loss', description: 'Ming Pong loss')
Metric.create(name: 'ming_pong_victory', default_unit: 2, description: 'Ming Pong victory')

Badge.create(name: 'first_time', description: 'First timer')

Badge.create(name: '1_github_commit', description: 'First GitHub commit')
Badge.create(name: '100_github_commits', description: '100 GitHub commits')
Badge.create(name: '250_github_commits', description: '250 GitHub commits')
Badge.create(name: '500_github_commits', description: '500 GitHub commits')
Badge.create(name: '1000_github_commits', description: '1000 GitHub commits')

Badge.create(name: '1_jenkins_green_job', description: 'First Jenkins green job')
Badge.create(name: '100_jenkins_green_jobs', description: '100 Jenkins green jobs')
Badge.create(name: '250_jenkins_green_jobs', description: '250 Jenkins green jobs')
Badge.create(name: '500_jenkins_green_jobs', description: '500 Jenkins green jobs')
Badge.create(name: '1000_jenkins_green_jobs', description: '1000 Jenkins green jobs')

Badge.create(name: '1_ming_pong_victory', description: 'First Ming Pong victory')
Badge.create(name: '1_ming_pong_loss', description: 'First Ming Pong loss')
Badge.create(name: '10_ming_pong_victories', description: '10 Ming Pong victories')

User.create(email: 'ash@greenworm.com.au')
User.create(email: 'locusdelicti@gmail.com')
