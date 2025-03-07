# Clear existing data
Book.destroy_all
Borrowing.destroy_all

# Create sample books
books = [
  { title: "To Kill a Mockingbird", author: "Harper Lee", published_year: 1960, status: "available" },
  { title: "1984", author: "George Orwell", published_year: 1949, status: "available" },
  { title: "The Great Gatsby", author: "F. Scott Fitzgerald", published_year: 1925, status: "available" },
  { title: "The Hobbit", author: "J.R.R. Tolkien", published_year: 1937, status: "available" },
  { title: "Pride and Prejudice", author: "Jane Austen", published_year: 1813, status: "available" }
]

books.each do |book_data|
  Book.create!(book_data)
end

puts "Created #{Book.count} books"

# Sample borrowing history
book = Book.find_by(title: "The Great Gatsby")
book.update(status: "borrowed")
borrowing = Borrowing.create!(
  book: book,
  borrower_name: "John Smith",
  borrowed_at: 2.weeks.ago
)

book = Book.find_by(title: "To Kill a Mockingbird")
borrowing = Borrowing.create!(
  book: book,
  borrower_name: "Jane Doe",
  borrowed_at: 3.weeks.ago,
  returned_at: 2.weeks.ago
)

puts "Created sample borrowing history"