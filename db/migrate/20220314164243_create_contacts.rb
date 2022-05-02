class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.integer :document
      t.string :birthday
      t.string :email
      t.string :mobile
      t.text :message
      t.boolean :advertising
      t.boolean :active

      t.timestamps
    end
  end
end
