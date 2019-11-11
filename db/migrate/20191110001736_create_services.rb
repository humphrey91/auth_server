class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :key
      t.string :password_digest
      t.string :name

      t.timestamps
    end
    add_index :services, :name, unique: true
  end
end
