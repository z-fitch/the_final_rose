class CreateContestantOutings < ActiveRecord::Migration[7.0]
  def change
    create_table :contestant_outings do |t|
      t.references :contestant, null: false, foreign_key: true
      t.references :outing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
