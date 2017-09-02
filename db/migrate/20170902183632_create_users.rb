class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :phone, limit: 10
      t.string :address
      t.string :password_digest
      t.string :account_type

      t.timestamps
    end
  end
end
