class Borrowing < ApplicationRecord
    belongs_to :book
  
    validates :borrower_name, presence: true
    validates :borrowed_at, presence: true
    validate :returned_at_cannot_be_before_borrowed_at
  
    def returned_at_cannot_be_before_borrowed_at
      if returned_at.present? && returned_at < borrowed_at
        errors.add(:returned_at, "cannot be before borrowed_at")
      end
    end
  end