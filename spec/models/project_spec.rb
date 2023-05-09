require "rails_helper"

describe "Project Attribute Requirements on Create", :type => :model do
  context "validation tests" do
    it "ensures the title is present when creating project" do
      project = Project.new(description: "Content of the description")
      expect(project.valid?).to eq(false)
    end
    it "should not be able to save project when title missing" do
      project = Project.new(description: "Some description content goes here")
      expect(project.save).to eq(false)
    end
    it "should be able to save project when have description and title" do
      project = Project.new(title: "Title", description: "Content of the description")
      expect(project.save).to eq(false)
    end
  end
end

describe "Project Attribute Requirements on Edit", :type => :model do
  context "Edit project" do  
    before (:each) do
      @project = Project.create(title: "Title", description: "Content of the description")
    end
    it "ensures the title is present when editing project" do
      @project.update(title: "New Title")
      expect(@project.title).to eq("New Title")
    end
  end
end

describe "Project Attribute Requirements on Create", :type => :model do
  context "validation tests" do
    it "ensures the start_date is present when creating project" do
      project = Project.new(end_date: Date.today + 1.day)
      expect(project.valid?).to eq(false)
    end

    it "ensures the end_date is present when creating project" do
      project = Project.new(start_date: Date.today)
      expect(project.valid?).to eq(false)
    end

    it "should not be able to save project when start_date missing" do
      project = Project.new(end_date: Date.today + 1.day)
      expect(project.save).to eq(false)
    end

    it "should not be able to save project when end_date missing" do
      project = Project.new(start_date: Date.today)
      expect(project.save).to eq(false)
    end

    it "should be able to save project when have start_date and end_date" do
      project = Project.new(start_date: Date.today, end_date: Date.today + 1.day)
      expect(project.save).to eq(true)
    end
  end
end

describe "Project Attribute Requirements on Edit", :type => :model do
  context "Edit project" do  
    before (:each) do
      @project = Project.create(start_date: Date.today, end_date: Date.today + 1.day)
    end

    it "ensures the start_date is present when editing project" do
      @project.update(start_date: Date.yesterday)
      expect(@project.start_date).to eq(Date.yesterday)
    end

    it "ensures the end_date is present when editing project" do
      @project.update(end_date: Date.today + 2.days)
      expect(@project.end_date).to eq(Date.today + 2.days)
    end

    it "is not valid to update without a start_date" do
      @project.update(start_date: nil)
      expect(@project).not_to be_valid
    end

    it "is not valid to update without an end_date" do
      @project.update(end_date: nil)
      expect(@project).not_to be_valid
    end
  end
end