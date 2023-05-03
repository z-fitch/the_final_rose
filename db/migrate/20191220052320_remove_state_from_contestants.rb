class RemoveStateFromContestants < ActiveRecord::Migration[7.0]
  def change
    remove_column :contestants, :state, :string
  end
end
