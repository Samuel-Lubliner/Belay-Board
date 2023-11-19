class CreateGuests < ActiveRecord::Migration[7.0]
  def change
    create_table :guests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :availability, null: false, foreign_key: true
      t.string :status, default: 'pending'

      t.timestamps
    end

    add_index :guests, [:user_id, :availability_id], unique: true
  end
end
