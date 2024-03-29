class CreateLinkedConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :linked_connections do |t|
      t.references :user, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
