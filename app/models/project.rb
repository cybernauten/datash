class Project < ApplicationRecord
  has_many :cooperations
  has_many :documents
  has_many :users, through: :assignments
  has_many :assignments
end
