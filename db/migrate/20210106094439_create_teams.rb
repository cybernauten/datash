class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :team_name
      t.string :description
      t.string :avatar_url

      t.timestamps
    end
  end
end
