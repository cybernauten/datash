class Project < ApplicationRecord
  searchkick # word_middle: [:project_name, :description]

  has_many :cooperations
  has_many :documents
  has_many :assignments
  has_many :users, through: :assignments

  # def search_data
  #   {
  #     project_name: project_name,
  #     description: description
  #   }
  # end
end
