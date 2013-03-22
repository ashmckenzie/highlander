class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :slug
      t.string  :email
      t.integer :total_score, default: 0
      t.string  :emails, array: true, default: '{}'
      t.string  :bio, limit: 128
      t.string  :preferred_email
      t.boolean :enabled, default: true
      t.boolean :earns_points, default: true
      t.string  :twitter_username
      t.timestamps
    end

    User.create(emails: ['ash@hooroo.com', 'ash@greenworm.com.au'], twitter_username: 'ashmckenzie', name: 'Ash McKenzie', bio: 'Software engineer, Boxer owner and craft beer & gaming connoisseur')
    User.create(emails: ['daniel@hooroo.com', 'locusdelicti@gmail.com'], twitter_username: 'unroundme', name: 'Dan Bradford', bio: "PhD Candidate and researcher, Developer and FLOSS enthusiast with a dull sense of humour. You've been warned.")
    User.create(emails: ['stuart@hooroo.com', 'stuart.liston@gmail.com'], twitter_username: 'stuliston', name: 'Stu Liston', bio: 'Scotsman in Melbourne. Husband, Pug Owner & Rubyist.')
    User.create(emails: ['andrei@hooroo.com', ''], name: 'Andrei Miulescu')
    User.create(emails: ['ashley@hooroo.com'], name: 'Ashley Cambrell', bio: 'Software dev. Web, Java, ROR')
    User.create(emails: ['chris@hooroo.com'], name: 'Chris Rode')
    User.create(emails: ['gabe@hooroo.com', 'gabe@rotbart.net', 'rotbart@gmail.com'], name: 'Gabriel Rotbart', bio: 'Sharpening the saw daily')
    User.create(emails: ['james@hooroo.com', 'james@martelletti.com.au'], name: 'James Martelletti', bio: 'Part-time chainsaw enthusiast')
    User.create(emails: ['jamesd@hooroo.com', 'jamesdunwoody@gmail.com'], name: 'James Dunwoody')
    User.create(emails: ['kunal@hooroo.com', 'kunal@techthumb.in'], name: 'Kunal Parikh')
    User.create(emails: ['michael@hooroo.com'], name: 'Michael Krzanich', bio: "Hiya, I'm a UX guy based in beautiful Melbourne Australia.")
    User.create(emails: ['mike@hooroo.com', 'mike@thealphatester.com'], name: 'Mike Bain', bio: 'Alpha Tester')
    User.create(emails: ['me@mikemortimer.com', 'mikem@hooroo.com'], name: 'Mike Mortimer', bio: 'Product Manager @Hooroo making Australian travel awesome')
    User.create(emails: ['peter@hooroo.com', 'peterlmoran@gmail.com', 'workingpeter@gmail.com'], name: 'Peter Moran')
    User.create(emails: ['phil@hooroo.com', 'metcalfe.phil@gmail.com'], name: 'Phil Metcalfe', bio: 'Technology & digital product enthusiast. Product Manager at http://hooroo.com . Still searching for the perfect t-shirt...')
    User.create(emails: ['sarah@hooroo.com', 'sarahblayden@gmail.com'], name: 'Sarah Blayden')
    User.create(emails: ['tim@hooroo.com', 'dangertimo@gmail.com'], name: 'Timothy Dang', bio: "the beautiful web' aficionado. UX designer, front-end developer & Javascript ninja in training")

    User.all.each do |user|
      user.preferred_email = user.emails[-1]
      user.save!
    end
  end
end
