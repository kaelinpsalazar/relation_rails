require "rails_helper"

RSpec.describe "Edit Authors" do
  it "links you to the edit page" do
    author = Author.create!(name: "Matt Dinnaman", deceased: False, age: 34)
    visit "/authors"

    click_button "Edit #{author.name}" 

    expect(current_path).to eq("/authors/#{author.id}/edit") 
  end

  it "can edit the author" do 

  end



end