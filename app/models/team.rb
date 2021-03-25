class Team < ApplicationRecord
  has_many :linked_connections, dependent: :destroy
  has_many :users, through: :linked_connections
  has_many :projects, dependent: :destroy
end
