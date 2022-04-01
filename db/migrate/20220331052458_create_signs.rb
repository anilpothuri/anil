class CreateSigns < ActiveRecord::Migration[6.0]
  def change
    create_table :signs do |t|
      t.string :username
      t.text :mail
      

      t.timestamps
    end
  end
end
