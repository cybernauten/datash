class Document < ApplicationRecord
  belongs_to :project
  belongs_to :user

  #Mounts paperclip image
  has_attached_file :doc
  validates_attachment :doc, :content_type => { :content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
  # do_not_validate_attachment_file_type :doc
end
