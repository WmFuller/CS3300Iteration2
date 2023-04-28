# projects_controller_spec.rb
require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
    let(:user) { create(:user) }
  
    describe "GET #index" do
  it "assigns all projects to @projects" do
    project1 = FactoryBot.create(:project)
    project2 = FactoryBot.create(:project)
    get :index
    expect(assigns(:projects)).to eq(Project.all)
  end

  it "renders the index template" do
    get :index
    expect(response).to render_template("index")
  end
end

  
    describe "GET #new" do
      context "when user is signed in" do
        before do
          sign_in user
        end
  
        it "assigns a new project to @project" do
          get :new
          expect(assigns(:project)).to be_a_new(Project)
        end
  
        it "renders the new template" do
          get :new
          expect(response).to render_template("new")
        end
      end
  
      context "when user is not signed in" do
        it "redirects to sign_in page" do
          get :new
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end
  end
  