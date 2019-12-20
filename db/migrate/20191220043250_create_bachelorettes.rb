class CreateBachelorettes < ActiveRecord::Migration[5.2]
  def change
    create_table :bachelorettes do |t|
      t.string :name
      t.integer :season_number

      t.timestamps
    end
  end
end
