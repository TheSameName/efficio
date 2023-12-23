class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email,           null: false, index: { unique: true }
      t.string :password_digest, null: false

      t.boolean :verified, null: false, default: false

      t.timestamps

      t.boolean :admin, null: false, default: false
      t.string :folder_link, null: false, default: ""
    end
  end
end
