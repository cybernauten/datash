class Project < ApplicationRecord
  belongs_to :team
 
  has_many :documents, dependent: :delete_all
  has_many :assignments, dependent: :delete_all
  has_many :users, through: :assignments
end
