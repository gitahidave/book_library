require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "should not save book without title" do
    book = Book.new(author: "Author", published_year: 2020, status: "available")
    assert_not book.save, "Saved the book without a title"
  end
end