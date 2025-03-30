class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :users, id: :uuid do |t|
      t.string :name
      t.string :email, unique: true
      t.string :password_digest  # Secure passwords with bcrypt

      t.timestamps
    end
  end
end
