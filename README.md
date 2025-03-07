# Book Lending Library Application

This is a basic book lending library application built with Ruby on Rails (version 8). It allows users to manage books and track their borrowing history.

## Features

- Manage books (create, view, update, delete)
- Borrow and return books
- Track lending history
- View a specific borrower's borrowing history
- No authentication required (simple interface)

## Requirements

- Ruby 3.4.2
- Rails 8.0.1
- SQLite 2.1+

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/book_library.git
   cd book_library
   ```

2. Install dependencies:
   ```bash
   bundle install
   ```

3. Set up the database:
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. Start the server:
   ```bash
   bin/rails server
   ```

5. Access the application in your browser at `http://localhost:3000`

## Running Tests

Run all tests with:
```bash
rails test
```

## Models

- **Book**: Stores book information (title, author, published year, status)
- **Borrowing**: Tracks when books are borrowed and returned

## Database Schema

### Books
- title: string
- author: string
- published_year: integer
- status: string (available/borrowed)

### Borrowings
- book_id: references
- borrower_name: string
- borrowed_at: datetime
- returned_at: datetime

## License

This project is available as open source under the terms of the MIT License.