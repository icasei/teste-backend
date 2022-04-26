class AddCpfcnpjToContacts < ActiveRecord::Migration[7.0]
  def change
    add_column :contacts, :cpfcnpj, :string
  end
end
