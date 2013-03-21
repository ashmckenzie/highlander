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

User.destroy_all

User.create(emails: ['ash@hooroo.com', 'ash@greenworm.com.au'], name: 'Ash McKenzie', bio: 'Software engineer, Boxer owner and craft beer & gaming connoisseur')
User.create(emails: ['daniel@hooroo.com', 'locusdelicti@gmail.com'], name: 'Dan Bradford', bio: "PhD Candidate and researcher, Developer and FLOSS enthusiast with a dull sense of humour. You've been warned.")
User.create(emails: ['stuart@hooroo.com', 'stuart.liston@gmail.com'], name: 'Stu Liston', bio: 'Scotsman in Melbourne. Husband, Pug Owner & Rubyist.')
User.create(emails: ['andrei@hooroo.com'], name: 'Andrei Miulescu')
User.create(emails: ['ashley@hooroo.com'], name: 'Ashley Cambrell', bio: 'Software dev. Web, Java, ROR')
User.create(emails: ['chris@hooroo.com'], name: 'Chris Rode')
User.create(emails: ['gabe@hooroo.com', 'gabe@rotbart.net', 'rotbart@gmail.com'], name: 'Gabriel Rotbart', bio: 'Sharpening the saw daily')
User.create(emails: ['james@hooroo.com', 'james@martelletti.com.au'], name: 'James Martelletti', bio: 'Part-time chainsaw enthusiast')
User.create(emails: ['jamesd@hooroo.com', 'jamesdunwoody@gmail.com'], name: 'James Dunwoody')
User.create(emails: ['kunal@hooroo.com', 'kunal@techthumb.in'], name: 'Kunal Parikh')
User.create(emails: ['michael@hooroo.com'], name: 'Michael Krzanich', bio: "Hiya, I'm a UX guy based in beautiful Melbourne Australia.")
User.create(emails: ['mike@hooroo.com', 'mike@thealphatester.com'], name: 'Mike Bain', bio: 'Alpha Tester')
User.create(emails: ['mikem@hooroo.com', 'me@mikemortimer.com'], name: 'Mike Mortimer', bio: 'Product Manager @Hooroo making Australian travel awesome')
User.create(emails: ['peter@hooroo.com', 'peterlmoran@gmail.com'], name: 'Peter Moran')
User.create(emails: ['phil@hooroo.com', 'metcalfe.phil@gmail.com'], name: 'Phil Metcalfe', bio: 'Technology & digital product enthusiast. Product Manager at http://hooroo.com . Still searching for the perfect t-shirt...')
User.create(emails: ['sarah@hooroo.com', 'sarahblayden@gmail.com'], name: 'Sarah Blayden')
User.create(emails: ['tim@hooroo.com', 'dangertimo@gmail.com'], name: 'Timothy Dang', bio: "the beautiful web' aficionado. UX designer, front-end developer & Javascript ninja in training")
