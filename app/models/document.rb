class Document < ApplicationRecord
  belongs_to :project
  belongs_to :user

  #Mounts paperclip image
  has_attached_file :doc
  validates_attachment :doc, :content_type => { :content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document application/zip application/txt) }
  # %w(application/xls application/odt application/ods pdf application/tar application/tar.gz application/docx application/doc application/rtf application/txt application/rar application/zip application/pdf image/jpeg image/jpg image/png)
end
