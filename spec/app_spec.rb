require 'spec_helper'

feature 'Plan It!' do
  include Warden::Test::Helpers
  Warden.test_mode!

  let(:confirmed_user) {
    user = User.new first_name: "Jim",
                    last_name: "Bob",
                    email: "jim@bob.com",
                    password: "ZOMG!",
                    password_confirmation: "ZOMG!"
    user.confirmed_at = Time.now
    user.tap { |u| u.save! }
  }

  let(:event) {
    Event.create! event_name: 'my party',
                  event_type: 'birthday party',
                  date: '04/27/2014',
                  time: '7pm'
  }

  scenario 'User can create new' do
    login_as(confirmed_user, scope: :user)
    visit '/'
    click_on 'Start Planning'
    click_on 'Add Your Event'
    fill_in 'event[event_name]', with: 'my party'
    fill_in 'event[event_type]', with: 'birthday party'
    fill_in 'event[date]', with: '04/27/2014'
    fill_in 'event[time]', with: '7pm'
    click_on 'Add'
    expect(page).to have_content('my party')
    expect(page).to have_content('birthday party')
    expect(page).to have_content('04/27/2014')
    expect(page).to have_content('7pm')
  end

  scenario 'User can edit and update an event' do
    login_as(confirmed_user, scope: :user)
    visit edit_event_path(event)
    fill_in 'event[event_name]', with: "Ellie's party"
    fill_in 'event[event_type]', with: 'surprise birthday party'
    fill_in 'event[date]', with: '04/27/2014'
    fill_in 'event[time]', with: '7pm'
    click_on 'Update'
    expect(page).to have_content("Ellie's party")
    expect(page).to have_content('surprise birthday party')
    expect(page).to have_content('04/27/2014')
    expect(page).to have_content('7pm')
  end

  scenario 'User can delete an event' do
    login_as(confirmed_user, scope: :user)
    event # Trigger creation from the let
    visit events_path
    click_on 'Delete Event'
    expect(page).to_not have_content('my party')
    expect(page).to_not have_content('birthday party')
    expect(page).to_not have_content('04/27/2014')
    expect(page).to_not have_content('7pm')
  end
end
