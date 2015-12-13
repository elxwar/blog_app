require 'rails_helper'

RSpec.feature 'Showing an Article' do

  before do
    @john = User.create(email: 'john@example.com', password: 'password')
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: @john.email
    fill_in 'Password', with: @john.password
    click_button 'Log in'
    @article = Article.create(title: 'The first article', body: 'Body of the first article')
  end

  scenario 'Display individual article' do
    visit '/'

    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(page.current_path).to eq(article_path(@article))
  end

end