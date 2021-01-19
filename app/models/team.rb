class Team < ApplicationRecord
  has_many :linkedconnections
  has_many :users, through: :linkedconnections
  has_many :cooperations
  has_many :projects, through: :cooperations
end
