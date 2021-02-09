class Project < ApplicationRecord
  has_many :cooperations
  has_many :documents
  has_many :assignments
  has_many :users, through: :assignments
end
