require 'rails_helper'

RSpec.describe "Author show page", type: :feature do
  before :each do
    @author_1 = Author.create(name: 'Brandon Sanderson', deceased: false, age: 47)
    @author_2 = Author.create(name: 'Robert Jordan', deceased: true, age: 56)  # Use a local variable here
    @book_1 = Book.create(
      title: 'The Way of Kings',
      genre: 'Fantasy',
      is_published: true,
      publication_year: 2010,
      author_id: @author_1.id  # Correct usage of instance variable
    )
    @book_2 = Book.create(
      title: 'The Eye of the World',
      genre: 'Fantasy',
      is_published: true,
      publication_year: 1990,
      author_id: @author_2.id  # Correct usage of local variable
    )
  end

  # Story 2
  it "displays the correct author according to id" do
    visit author_path(@author_1)  
    expect(page).to have_content(@author_1.name)
    expect(page).to have_content(@author_1.deceased ? 'Yes' : 'No')
    expect(page).to have_content(@author_1.age)

    visit author_path(@author_2) 
    expect(page).to have_content(@author_2.name)
    expect(page).to have_content(@author_2.deceased ? 'Yes' : 'No')
    expect(page).to have_content(@author_2.age)
  end

  # Story 5 
  it "displays book attributes connected to an author" do 
    visit book_path(@book_1)  
    expect(page).to have_content(@book_1.title)
    expect(page).to have_content(@book_1.genre)
    expect(page).to have_content(@book_1.is_published? ? 'Yes' : 'No')
    expect(page).to have_content(@book_1.publication_year)

    visit book_path(@book_2) 
    expect(page).to have_content(@book_2.title)
    expect(page).to have_content(@book_2.genre)
    expect(page).to have_content(@book_2.is_published? ? 'Yes' : 'No')
    expect(page).to have_content(@book_2.publication_year)

    visit author_path(@book_1.author)
    expect(page).to have_content(@book_1.author.name)
    visit author_path(@book_2.author)
    expect(page).to have_content(@book_2.author.name)
  end
end
