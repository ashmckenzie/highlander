class AddTwitterUsernamesToUsers < ActiveRecord::Migration
  def change
    {
      'ashley@hooroo.com' => 'freakynamuh',
      'andrei@hooroo.com' => 'andreimiulescu',
      'chris@hooroo.com' => 'cirode',
      'gabe@hooroo.com' => 'gabrielrotbart',
      'james@hooroo.com' => '0x4a616d6573',
      'jamesd@hooroo.com' => 'jdunwoody',
      'kunal@hooroo.com' => 'techthumb',
      'michael@hooroo.com' => 'digital_face',
      'mike@hooroo.com' => 'Mike_Bain',
      'mikem@hooroo.com' => 'mikmortimer',
      'peter@hooroo.com' => 'petermoran',
      'phil@hooroo.com' => 'philmetcalfe',
      'sarah@hooroo.com' => 'SairrrB',
      'tim@hooroo.com' => 'supatimbo'

    }.each do |email, twitter_username|
      add_twitter_username_for(email, twitter_username)
    end
  end

  private

  def add_twitter_username_for email, twitter_username
    User.with_email(email).update(twitter_username: twitter_username)
  end
end
