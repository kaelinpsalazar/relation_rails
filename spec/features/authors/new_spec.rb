require "rails_helper"

RSpec.describe " Author Creation", type: :feature do
  before :each do
    @author_1 = Author.create(name: 'Brandon Sanderson', deceased: false, age: 47)
    @author_2 = Author.create(name: 'Robert Jordan', deceased: true, age: 56)
    @author_3 = Author.create(name: 'Pierce Brown', deceased: false, age: 35)
    @book_1 = Book.create(
      title: 'The Way of Kings',
      genre: 'Fantasy',
      is_published: true,
      publication_year: 2010,
      author_id: @author_1.id
      )
      @book_2 = Book.create(
        title: 'The Eye of the World',
        genre: 'Fantasy',
        is_published: true,
        publication_year: 1990,
        author_id: @author_2.id
        )
  end
  it "shows new author form" do
    visit "/authors"

      expect(page).to have_link("New Author")
      click_link("New Author")
      expect(current_path).to eq("/authors/new")
  end

  it "can create a new author" do
    visit "/authors/new"

    fill_in "Name", with: "Pierce Brown"
    check "Deceased"
    fill_in "Age", with: 35
    click_button "Create Author"

    expect(current_path).to eq("/authors")
    expect(page).to have_content("Pierce Brown")
  end

end