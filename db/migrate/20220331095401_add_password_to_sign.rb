class AddPasswordToSign < ActiveRecord::Migration[6.0]
  def change
    add_column :signs, :password_digest, :string
  end
end
