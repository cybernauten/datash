class Team < ApplicationRecord
  searchkick

  has_many :linked_connections
  has_many :users, through: :linked_connections
  has_many :cooperations
  has_many :projects, through: :cooperations
end
