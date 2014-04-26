require 'spec_helper'

feature 'Plan It!' do
  scenario 'User can create events' do
    visit '/events'
    click_on 'Add Event'
    fill_in 'event_name', with: 'my party'
    fill_in 'event_type', with: 'birthday for me'
    fill_in 'date', with: '04/27/2014'
    fill_in 'time', with: '7pm'
    click_on 'Add'
    expect(page).to have_content('my party')
  end
end