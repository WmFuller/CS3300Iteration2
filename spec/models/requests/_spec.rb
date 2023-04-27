RSpec.configure do |config|
    config.include Devise::Test::IntegrationHelpers, type: :request # to sign_in user by Devise
  end
  
  # then in an example
  let(:user) { create(:user) }
  it "an example" do
    sign_in user
    get "/articles"
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:index)
  end

  RSpec.shared_context :login_user do
    let(:user) { create(:user) }
    before { sign_in user }
  end
  
  # then use include_context to include it
  include_context :login_user

  RSpec.describe "/articles", type: :request do
    let(:valid_attributes) {
      skip("Add a hash of attributes valid for your model")
    }
  
    let(:invalid_attributes) {
      skip("Add a hash of attributes invalid for your model")
    }
  
    describe "GET /index" do
      it "renders a successful response" do
        Article.create! valid_attributes
        get articles_url
        expect.to have_http_status(:unprocessable_entity)
      end
    end
  
    describe "GET /show" do
      it "renders a successful response" do
        article = Article.create! valid_attributes
        get article_url(article)
        expect.to have_http_status(:unprocessable_entity)
      end
    end
  
    describe "GET /new" do
      it "renders a successful response" do
        get new_article_url
        expect.to have_http_status(:unprocessable_entity)
      end
    end
  
    describe "GET /edit" do
      it "render a successful response" do
        article = Article.create! valid_attributes
        get edit_article_url(article)
        expect.to have_http_status(:unprocessable_entity)
      end
    end
  
    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new Article" do
          expect {
            post articles_url, params: { article: valid_attributes }
          }.to change(Article, :count).by(1)
        end
  
        it "redirects to the created article" do
          post articles_url, params: { article: valid_attributes }
          expect(response).to redirect_to(article_url(Article.last))
        end
      end
  
      context "with invalid parameters" do
        it "does not create a new Article" do
          expect {
            post articles_url, params: { article: invalid_attributes }
          }.to change(Article, :count).by(0)
        end
  
        it "renders a successful response (i.e. to display the 'new' template)" do
          post articles_url, params: { article: invalid_attributes }
          expect.to have_http_status(:unprocessable_entity)
        end
      end
    end
  
    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {
          skip("Add a hash of attributes valid for your model")
        }
  
        it "updates the requested article" do
          article = Article.create! valid_attributes
          patch article_url(article), params: { article: new_attributes }
          article.reload
          skip("Add assertions for updated state")
        end
  
        it "redirects to the article" do
          article = Article.create! valid_attributes
          patch article_url(article), params: { article: new_attributes }
          article.reload
          expect(response).to redirect_to(article_url(article))
        end
      end
  
      context "with invalid parameters" do
        it "renders a successful response (i.e. to display the 'edit' template)" do
          article = Article.create! valid_attributes
          patch article_url(article), params: { article: invalid_attributes }
          expect.to have_http_status(:unprocessable_entity)
        end
      end
    end
  
    describe "DELETE /destroy" do
      it "destroys the requested article" do
        article = Article.create! valid_attributes
        expect {
          delete article_url(article)
        }.to change(Article, :count).by(-1)
      end
  
      it "redirects to the articles list" do
        article = Article.create! valid_attributes
        delete article_url(article)
        expect(response).to redirect_to(articles_url)
      end
    end
  end

  RSpec.describe "/articles", type: :request do
    let(:valid_attributes) {
      {
        title: 'A Article Title',
        contenxt: 'It is an article content.'
      }
    }
    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new Article" do
          expect {
            post articles_url, params: { article: valid_attributes }
          }.to change(Article, :count).by(1)
          article = Article.last
          # I always assert every attribute explicitly instead of writing enumerable methods 
          # to reduce the assertions code.
          # I don't want to have a false positive situation.
          expect(article.title).to eq('A Article Title')
          expect(article.content).to eq('It is an article content.')
        end
      end
    end