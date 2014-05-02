require 'spec_helper'

feature 'Plan It!' do
  scenario 'User can create new' do
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

  scenario 'User can edit an event' do
    visit '/'
    click_on 'Start Planning'
    click_on 'Add Your Event'
    fill_in 'event[event_name]', with: 'my party'
    fill_in 'event[event_type]', with: 'birthday party'
    fill_in 'event[date]', with: '04/27/2014'
    fill_in 'event[time]', with: '7pm'
    click_on 'Add'
    click_on 'Edit Event'
    fill_in 'event[event_name]', with: "Ellie's party"
    fill_in 'event[event_type]', with: 'surprise birthday party'
    fill_in 'event[date]', with: '04/27/2014'
    fill_in 'event[time]', with: '7pm'
    click_on 'Update'
    expect(page).to have_content("Ellie's party")
  end
end
