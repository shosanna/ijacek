require "spec_helper"

describe Entry do

  it "has an author" do
    Entry.new.author.should be_nil
  end

end