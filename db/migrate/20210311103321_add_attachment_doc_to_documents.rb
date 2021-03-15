class AddAttachmentDocToDocuments < ActiveRecord::Migration[6.0]
  def self.up
    change_table :documents do |t|
      t.attachment :doc
    end
  end

  def self.down
    remove_attachment :documents, :doc
  end
end
