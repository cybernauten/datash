class Team < ApplicationRecord
  has_many :linked_connections
  has_many :users, through: :linked_connections
  has_many :projects
end
