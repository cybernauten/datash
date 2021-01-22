class Project < ApplicationRecord
  has_many :cooperations
  has_many :documents
end
