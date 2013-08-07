require 'spec_helper'

feature 'PagerDuty Ack' do

  given(:endpoint) { '/api/pager_duty_ack.json' }

  background do
    @first_time_badge     = FactoryGirl.create(:first_time)
    @one_pager_duty_ack   = FactoryGirl.create(:one_pager_duty_ack)
  end

  given!(:user)                   { FactoryGirl.create(:user, :pager_duty_gimp) }
  given!(:pager_duty_service)     { user.service_for(:pager_duty) }
  given!(:pager_duty_ack_metric)  { FactoryGirl.create(:pager_duty_ack) }

  given(:valid_params) do
    {
      metric:   pager_duty_ack_metric.name,
      id:       'PONT0QB',
      agent:    { email: pager_duty_service.email }
    }
  end

  describe 'First PagerDuty ack' do

    background { page.driver.post endpoint, valid_params }

    scenario 'User is given First Time and One PagerDuty Ack badge' do

      visit user_path(user)
      page.should have_content @first_time_badge.description
      page.should have_content @one_pager_duty_ack.description

      page.should have_content "#{pager_duty_ack_metric.default_unit} All-time"
      page.should have_content '2 badges'
    end
  end

  describe "Multiple PagerDuty Ack's" do

    background do
      page.driver.post endpoint, valid_params.merge(id: 'PONT0QC')
      page.driver.post endpoint, valid_params.merge(id: 'PONT0QD')
      page.driver.post endpoint, valid_params.merge(id: 'PONT0QE')
    end

    scenario 'User is given appropriate badges and points' do

      visit user_path(user)
      page.should have_content @first_time_badge.description
      page.should have_content @one_pager_duty_ack.description

      page.should have_content "#{pager_duty_ack_metric.default_unit * 3} All-time"
      page.should have_content '2 badges'
    end
  end

  describe "Ensuring the same Ack isn't pointed twice" do

    background do
      page.driver.post endpoint, valid_params.merge(id: 'PONT0QC')
      page.driver.post endpoint, valid_params.merge(id: 'PONT0QD')
      page.driver.post endpoint, valid_params.merge(id: 'PONT0QC')
    end

    scenario 'User only given points for original acks' do

      visit user_path(user)
      page.should have_content @first_time_badge.description
      page.should have_content @one_pager_duty_ack.description

      page.should have_content "#{pager_duty_ack_metric.default_unit * 2} All-time"
      page.should have_content '2 badges'
    end
  end

end
