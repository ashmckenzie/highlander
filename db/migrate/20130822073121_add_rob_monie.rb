class AddRobMonie < ActiveRecord::Migration
  def change

    rob = User.find_or_initialize_by(hooroo_email: 'robm@hooroo.com').tap do |r|
      r.name          = 'Rob Monie'
      r.emails        = ['robmonie@gmail.com', 'robm@hooroo.com']
      r.avatar_email  = 'robmonie@gmail.com'
      r.role          = 'user'
    end

    ghs = Services::Github.new(username: 'robmonie', emails: ['robmonie@gmail.com'])
    pds = Services::PagerDuty.new(email: 'robm@hooroo.com')
    ts  = Services::Twitter.new(username: 'robmonie')

    rob.user_services = [
      UserService.new(service: ghs),
      UserService.new(service: pds),
      UserService.new(service: ts)
    ]

    rob.save!

  end
end
