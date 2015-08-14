require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('show the add word path', {:type => :feature}) do
  it('adds a word to a list') do
    visit('/')
    fill_in('word', :with => 'Hitchens')
    click_button('add word')
    expect(page).to have_content('Hitchens')
  end

  it('adds a definition to a word') do
    visit('/')
    fill_in('word', :with => 'islam')
    click_button('add word')
    click_link('islam')
    fill_in('definition', :with => 'a religion')
    click_button('add definition')
    expect(page).to have_content('a religion')
  end

end
