module DataMigration
  module MigrationFiles
    class AddUsers < Base

      def up
        User.create!(hooroo_email: 'ash@hooroo.com', emails: ['ash@hooroo.com', 'ash@greenworm.com.au'],  name: 'Ash McKenzie', bio: 'Software engineer, Boxer owner and craft beer & gaming connoisseur')
        User.create!(hooroo_email: 'daniel@hooroo.com', emails: ['daniel@hooroo.com', 'locusdelicti@gmail.com'], name: 'Dan Bradford', bio: "PhD Candidate and researcher, Developer and FLOSS enthusiast with a dull sense of humour. You've been warned.")
        User.create!(hooroo_email: 'stuart@hooroo.com', emails: ['stuart@hooroo.com', 'stuart.liston@gmail.com'], name: 'Stu Liston', bio: 'Scotsman in Melbourne. Husband, Pug Owner & Rubyist.')
        User.create!(hooroo_email: 'andrei@hooroo.com', emails: ['andrei@hooroo.com', ''], name: 'Andrei Miulescu')
        User.create!(hooroo_email: 'ashley@hooroo.com', emails: ['ashley@hooroo.com'], name: 'Ashley Cambrell', bio: 'Software dev. Web, Java, ROR')
        User.create!(hooroo_email: 'chris@hooroo.com', emails: ['chris@hooroo.com'], name: 'Chris Rode')
        User.create!(hooroo_email: 'gabe@hooroo.com', emails: ['gabe@hooroo.com', 'gabe@rotbart.net', 'rotbart@gmail.com'], name: 'Gabriel Rotbart', bio: 'Sharpening the saw daily')
        User.create!(hooroo_email: 'james@hooroo.com', emails: ['james@hooroo.com', 'james@martelletti.com.au'], name: 'James Martelletti', bio: 'Part-time chainsaw enthusiast')
        User.create!(hooroo_email: 'jamesd@hooroo.com', emails: ['jamesd@hooroo.com', 'jamesdunwoody@gmail.com'], name: 'James Dunwoody')
        User.create!(hooroo_email: 'kunal@hooroo.com', emails: ['kunal@hooroo.com', 'kunal@techthumb.in'], name: 'Kunal Parikh')
        User.create!(hooroo_email: 'michael@hooroo.com', emails: ['michael@hooroo.com'], name: 'Michael Krzanich', bio: "Hiya, I'm a UX guy based in beautiful Melbourne Australia.")
        User.create!(hooroo_email: 'mike@hooroo.com', avatar_email: 'mike@macba.in', emails: ['mike@hooroo.com', 'mike@thealphatester.com'], name: 'Mike Bain', bio: 'Alpha Tester')
        User.create!(hooroo_email: 'mikem@hooroo.com', emails: ['me@mikemortimer.com', 'mikem@hooroo.com'], name: 'Mike Mortimer', bio: 'Product Manager @Hooroo making Australian travel awesome')
        User.create!(hooroo_email: 'peter@hooroo.com', emails: ['peter@hooroo.com', 'peterlmoran@gmail.com', 'workingpeter@gmail.com'], name: 'Peter Moran')
        User.create!(hooroo_email: 'phil@hooroo.com', emails: ['phil@hooroo.com', 'metcalfe.phil@gmail.com'], name: 'Phil Metcalfe', bio: 'Technology & digital product enthusiast. Product Manager at http://hooroo.com . Still searching for the perfect t-shirt...')
        User.create!(hooroo_email: 'sarah@hooroo.com', emails: ['sarah@hooroo.com', 'sarahblayden@gmail.com'], name: 'Sarah Blayden')
        User.create!(hooroo_email: 'tim@hooroo.com', emails: ['tim@hooroo.com', 'dangertimo@gmail.com'], name: 'Timothy Dang', bio: "the beautiful web' aficionado. UX designer, front-end developer & Javascript ninja in training")
        User.create!(hooroo_email: 'michelle@hooroo.com', emails: ['michelle@hooroo.com'], name: 'Michelle Legge', bio: 'Content and Social Manager for Aussie hotel booking site @Hooroo. Travel is everything')
      end

      def down
        User.destroy_all
      end
    end
  end
end
