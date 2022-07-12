class Transaction < ApplicationRecord
  # belongs_to :user
  validates :input_amount, numericality: true
end
