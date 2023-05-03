class CreateContestants < ActiveRecord::Migration[7.0]
  def change
    create_table :contestants do |t|
      t.string :name
      t.integer :age
      t.string :hometown
      t.string :state
      t.references :bachelorette, foreign_key: true

      t.timestamps
    end
  end
end
