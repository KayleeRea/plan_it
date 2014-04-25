require 'spec_helper'

feature 'Plan It!' do
  scenario 'User can CRUD events' do
    visit '/events'
    expect(page).to have_link('Add')
  end
end