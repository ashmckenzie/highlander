require 'spec_helper'

feature 'Ping Pong Victory' do

  given(:endpoint) { '/api/ping_pong_victory.json' }

  background do
    @first_time_badge         = FactoryGirl.create(:first_time)
    @one_ping_pong_victory    = FactoryGirl.create(:one_ping_pong_victory)
    @ten_ping_pong_victories  = FactoryGirl.create(:ten_ping_pong_victories)
  end

  given(:winner)                    { FactoryGirl.create(:user, :tweeter, name: 'Stu Liston') }
  given(:loser)                     { FactoryGirl.create(:user, :tweeter, name: 'Phil Metcalfe') }
  given!(:winner_twitter_service)   { winner.service_for(:twitter) }
  given!(:loser_twitter_service)   { loser.service_for(:twitter) }
  given(:ping_pong_victory_metric)  { FactoryGirl.create(:ping_pong_victory) }

  given(:valid_params) do
    {
      metric:     ping_pong_victory_metric.name,
      winner:     winner_twitter_service.username,
      loser:      loser_twitter_service.username,
      match_id:   1234,
      played_at:  1365664810289,
      points:     20
    }
  end

  describe 'First victory' do

    background { page.driver.post endpoint, valid_params }

    scenario 'User is given First Time and One Ping Pong Victory badges' do

      visit user_path(winner)
      page.should have_content @first_time_badge.description
      page.should have_content @one_ping_pong_victory.description

      page.should have_content "#{ping_pong_victory_metric.default_unit} All-time"
      page.should have_content '2 Badges'
    end
  end

  describe 'Receiving match update twice' do

    background { 2.times { page.driver.post endpoint, valid_params } }

    scenario 'Winner is not given points again' do

      visit user_path(winner)
      page.should have_content @first_time_badge.description
      page.should have_content @one_ping_pong_victory.description

      page.should have_content "#{ping_pong_victory_metric.default_unit} All-time"
      page.should have_content '2 Badges'
    end
  end

  describe 'Tenth victory' do

    background { 10.times { |i| page.driver.post endpoint, valid_params.merge(match_id: i) } }

    scenario 'User gets ten pong victories badge' do

      visit user_path(winner)
      page.should have_content @first_time_badge.description
      page.should have_content @one_ping_pong_victory.description
      page.should have_content @ten_ping_pong_victories.description

      page.should have_content "#{ping_pong_victory_metric.default_unit * 10} All-time"
      page.should have_content '3 Badges'
    end
  end

end
