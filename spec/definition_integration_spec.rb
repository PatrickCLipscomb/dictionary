require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the definition creation path', {:type => :feature}) do
  it('creates a word of the Word class that contains a Definition class') do
    visit('/')
    fill_in('definition', :with => 'lazy')
    click_button('Add word to list')
    expect(page).to have_content('lazy')
  end
  it('creates a word of the Word class that contains a Definition class') do
    visit('/')
    fill_in('example', :with => 'indolent children often become indolent adults')
    click_button('Add word to list')
    expect(page).to have_content('indolent children often become indolent adults')
  end
end
