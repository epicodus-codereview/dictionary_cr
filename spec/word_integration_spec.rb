require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::application
set(:show_exceptions, false)

describe('the add word path', {:type => :feature}) do
  it('adds a word to a list') do
    visit('/')
    fill_in('word', :with => 'Hitchens')
    click_button('add word')
    expect(page).to have_content('Hitchens')
  end

end
