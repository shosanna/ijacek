require "spec_helper"

describe ActivitiesController, controller: true do

  describe "POST create" do
    it "creates a new activity" do
      Activity.delete_all

      post :create, activity: { activity_person_id: [""] }

      Activity.first.name.should == nil
    end
  end

end