require 'rails_helper'

RSpec.feature 'Showing an Article' do

  before do
    john = User.create(email: 'john@example.com', password: 'password')
    login_as(john)
    @article = Article.create(title: 'The first article', body: 'Body of the first article', user: john)
  end

  scenario 'Display individual article' do
    visit '/'

    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(page.current_path).to eq(article_path(@article))
  end

end