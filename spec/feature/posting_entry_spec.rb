require "spec_helper"

feature "Posting a new entry" do

  before do
    %w(Kuba Simonka Pavel Martina Arnie Joc Tom Tyna).each do |user|
      a = Person.new(:username => user)
      a.password = "heslo"
      a.save
    end

    Person.first.update_attributes(ijacek: true)
  end

  it "Create a new activity" do
    Activity.create(name: "nuf")

    visit root_path

    click_link "nuf"
    click_link "Edit activity"
    page.body.should include("Sorry, you are not logged in")
  end

  it "Log in and write entry" do
    visit signin_path
    fill_in "username", with: "Tom"
    fill_in "password", with: "heslo"
    click_button "Submit"

    page.body.should include("Logged in as Tom.")

    fill_in "entry_text", with: "nuf entry"
    click_button "Submit"

    page.body.should include("nuf entry")
  end

  it "Add yourself to the activity" do
    Activity.create(name: "nuf")
    visit signin_path
    fill_in "username", with: "Tom"
    fill_in "password", with: "heslo"
    click_button "Submit"
    visit activity
    click_link "I was there!"
    page.body.should include("You just added yourself to the event!")
  end

    it "Add yourself to the activity REPEATING" do
    Activity.create(name: "nuf")
    visit signin_path
    fill_in "username", with: "Tom"
    fill_in "password", with: "heslo"
    click_button "Submit"
    visit activity
    click_link "I was there!"
    page.body.should include("You just added yourself to the event!")
    click_link "I was there!"
    page.body.should include("You just added yourself to the event!")
  end

end
