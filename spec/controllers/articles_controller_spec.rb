require 'rails_helper'
require 'support/macros'

RSpec.describe ArticlesController, type: :controller do

  describe "GET #edit" do
    before do
      @john = User.create(email: 'john@example.com', password: 'password')
    end

    context 'owner is allowed to edit their articles' do
      it 'renders the template' do
        sign_in @john
        article = Article.create(title: 'The first article', body: 'Body of the first article', user: @john)

        get :edit, id: article
        expect(response).to render_template :edit
      end
    end

    context 'non owner is not allowed to edit other users articles' do
          it 'redirects to the root path' do
            fred = User.create(email: 'fred@example.com', password: 'password')

            sign_in fred
            article = Article.create(title: 'The first article', body: 'Body of the first article', user: @john)

            get :edit, id: article
            expect(response).to redirect_to(root_path)
            message = 'You can only edit your own article.'
            expect(flash[:danger]).to eq message
          end
        end

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
