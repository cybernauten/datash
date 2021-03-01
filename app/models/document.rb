class Document < ApplicationRecord
  searchkick

  belongs_to :project
  belongs_to :user
end
