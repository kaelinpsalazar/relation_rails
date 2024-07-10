require 'rails_helper'

RSpec.describe 'author book index' do
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

  # story 1 
  it "shows all the author record names" do
    visit "/authors"
    expect(page).to have_content(@author_1.name)
    expect(page).to have_content(@author_2.name)
    expect(page).to have_content(@author_1.age)
    expect(page).to have_content(@author_2.age)
    expect(page).to have_content(@author_1.deceased)
    expect(page).to have_content(@author_2.deceased)
  end

end