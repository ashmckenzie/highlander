Metric.destroy_all

Metric.create(name: 'github_push', description: 'GitHub push')
Metric.create(name: 'jenkins_green_job', description: 'Jenkins green job')
Metric.create(name: 'ming_pong_loss', description: 'Ming Pong loss')
Metric.create(name: 'ming_pong_victory', default_unit: 2, description: 'Ming Pong victory')
Metric.create(name: 'gift', description: 'A gift - good or bad!')
Metric.create(name: 'express_yaself', description: 'Expressed Yaself!')
Metric.create(name: 'twitter_mention', description: 'Twitter mention')

Badge.destroy_all

Badge.create(name: 'first_time', tag: 'Experience the quickening', description: 'First timer')

Badge.create(name: '1_github_push', tag: 'Octocat is pleased with you', description: 'First GitHub push')
Badge.create(name: '100_github_pushes', tag: 'Pusher centurion', description: '100 GitHub pushes')
Badge.create(name: '250_github_pushes', tag: 'Pusher class act', description: '250 GitHub pushes')
Badge.create(name: '500_github_pushes', tag: 'Pusher beast', description: '500 GitHub pushes')
Badge.create(name: '1000_github_pushes', tag: 'Pusher GOD', description: '1000 GitHub pushes')

Badge.create(name: '1_jenkins_green_job', tag: 'Well done, sir', description: 'First Jenkins green job')
Badge.create(name: '100_jenkins_green_jobs', tag: 'Green goblin centurion', description: '100 Jenkins green jobs')
Badge.create(name: '250_jenkins_green_jobs', tag: 'Green goblin class act', description: '250 Jenkins green jobs')
Badge.create(name: '500_jenkins_green_jobs', tag: 'Green goblin beast', description: '500 Jenkins green jobs')
Badge.create(name: '1000_jenkins_green_jobs', tag: 'Green gobline GOD', description: '1000 Jenkins green jobs')

Badge.create(name: '1_ming_pong_victory', tag: 'One small step forward', description: 'First Ming Pong victory')
Badge.create(name: '1_ming_pong_loss', tag: "Well that's to be expected", description: 'First Ming Pong loss')
Badge.create(name: '10_ming_pong_victories', tag: 'Paddle master', description: '10 Ming Pong victories')

Badge.create(name: '1_twitter_mention', tag: 'Fly fly little birdie!', description: 'First Hooroo Twitter mention')
Badge.create(name: '25_twitter_mentions', tag: 'In a flutter', description: '25 Hooroo Twitter mentions')
Badge.create(name: '50_twitter_mentions', tag: 'Swoop in for the kill', description: '50 Hooroo Twitter Mentions')
