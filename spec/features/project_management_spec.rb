require "rails_helper"

RSpec.feature "Project management", :type => :feature do
  let(:user) { create(:user) }  # create a user
  let(:project_attributes) { attributes_for(:project) }

  scenario "User creates a new project" do
    login_as(user, scope: :user)  # log the user in
    visit "/projects/new"
  
    fill_in "Title", with: project_attributes[:title]
    fill_in "Description", with: project_attributes[:description]
  
    select project_attributes[:start_date].year.to_s,  from: "project_start_date_1i"  # year
    select Date::MONTHNAMES[project_attributes[:start_date].month], from: "project_start_date_2i"  # month
    select project_attributes[:start_date].day.to_s,   from: "project_start_date_3i"  # day
    select project_attributes[:start_date].hour.to_s,  from: "project_start_date_4i"  # hour
    select project_attributes[:start_date].min.to_s,   from: "project_start_date_5i"  # minute
  
    select project_attributes[:end_date].year.to_s,  from: "project_end_date_1i"  # year
    select Date::MONTHNAMES[project_attributes[:end_date].month], from: "project_end_date_2i"  # month
    select project_attributes[:end_date].day.to_s,   from: "project_end_date_3i"  # day
    select project_attributes[:end_date].hour.to_s,  from: "project_end_date_4i"  # hour
    select project_attributes[:end_date].min.to_s,   from: "project_end_date_5i"  # minute
  
    click_button "Create Project"
  
    expect(page).to have_text("Project was successfully created.")
  end
  
end
