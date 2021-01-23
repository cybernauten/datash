class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :linked_connections
  has_many :teams, through: :linked_connections
  has_many :linked_connections
  
  has_many :documents

  has_many :assignments
  has_many :projects, through: :assignments
end
