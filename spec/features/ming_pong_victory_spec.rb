require 'spec_helper'

feature 'Ming Pong Victory' do

  given(:endpoint) { '/api/ming_pong_victory.json' }

  background do
    @first_time_badge         = FactoryGirl.create(:first_time)
    @one_ming_pong_victory    = FactoryGirl.create(:one_ming_pong_victory)
    @ten_ming_pong_victories  = FactoryGirl.create(:ten_ming_pong_victories)
  end

  given(:winner)                    { FactoryGirl.create(:twitter_user, name: 'Stu Liston') }
  given(:loser)                     { FactoryGirl.create(:twitter_user, name: 'Phil Metcalfe') }
  given(:ming_pong_victory_metric)  { FactoryGirl.create(:ming_pong_victory) }

  given(:valid_params) do
    {
      metric:     ming_pong_victory_metric.name,
      winner:     winner.twitter_username,
      loser:      loser.twitter_username,
      match_id:   1234,
      played_at:  1365664810289,
      points:     20
    }
  end

  describe 'First victory' do

    background { page.driver.post endpoint, valid_params }

    scenario 'User is given First Time and One Ming Pong Victory badges' do

      visit user_path(winner)
      page.should have_content @first_time_badge.description
      page.should have_content @one_ming_pong_victory.description

      page.should have_content "#{ming_pong_victory_metric.default_unit} All-time"
      page.should have_content '2 Badges'
    end
  end

  describe 'Receiving match update twice' do

    background { 2.times { page.driver.post endpoint, valid_params } }

    scenario 'Winner is not given points again' do

      visit user_path(winner)
      page.should have_content @first_time_badge.description
      page.should have_content @one_ming_pong_victory.description

      page.should have_content "#{ming_pong_victory_metric.default_unit} All-time"
      page.should have_content '2 Badges'
    end
  end

  describe 'Tenth victory' do

    background { 10.times { |i| page.driver.post endpoint, valid_params.merge(match_id: i) } }

    scenario 'User gets ten pong victories badge' do

      visit user_path(winner)
      page.should have_content @first_time_badge.description
      page.should have_content @one_ming_pong_victory.description
      page.should have_content @ten_ming_pong_victories.description

      page.should have_content "#{ming_pong_victory_metric.default_unit * 10} All-time"
      page.should have_content '3 Badges'
    end
  end

end
