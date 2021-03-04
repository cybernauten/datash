class CreateCooperations < ActiveRecord::Migration[6.0]
  def change
    create_table :cooperations do |t|
      t.references :team, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
