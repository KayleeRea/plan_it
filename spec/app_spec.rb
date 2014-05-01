require 'spec_helper'

feature 'Plan It!' do
  scenario 'User can create new' do
    visit '/'
    click_on 'Add Event'
    click_on 'Start Planning!'
    fill_in 'event_name', with: 'my party'
    fill_in 'event_type', with: 'birthday for me'
    fill_in 'date', with: '04/27/2014'
    fill_in 'time', with: '7pm'
    click_on 'Add'
    expect(page).to have_content('my party')
  end

=begin
  scenario 'User can update new' do
    visit '/new/new'
    click_on 'Edit'
    fill_in 'event_name', with: 'my birthday party'
    click_on 'Update'
    expect(page).to have_content('my birthday party')
  end
=end
end
