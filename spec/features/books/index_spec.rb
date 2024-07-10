require 'rails_helper'

RSpec.describe 'book index' do
  before :each do
    @author_1 = Author.create(name: 'Brandon Sanderson', deceased: false, age: 47)
    @author_2 = Author.create(name: 'Robert Jordan', deceased: true, age: 56)
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

  # story 3
  it "show all book names and info" do
    visit "/books"
    expect(page).to have_content(@book_1.title)
    expect(page).to have_content(@book_1.genre)
    expect(page).to have_content(@book_1.is_published)
    expect(page).to have_content(@book_1.publication_year)
    expect(page).to have_content(@book_2.title)
    expect(page).to have_content(@book_2.genre)
    expect(page).to have_content(@book_2.is_published)
    expect(page).to have_content(@book_2.publication_year)
  end

end