class AddAdminToSigns < ActiveRecord::Migration[6.0]
  def change
    add_column :signs, :admin, :boolean, default: false
  end
end
