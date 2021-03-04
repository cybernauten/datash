class Project < ApplicationRecord
  belongs_to :team
  # has_many :teams, through: :cooperations
  has_many :documents
  has_many :assignments
  has_many :users, through: :assignments
end
