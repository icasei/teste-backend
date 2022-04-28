class AddCpfCnpjToContacts < ActiveRecord::Migration[7.0]
  def change
    add_column :contacts, :cpf_cnpj, :integer
  end
end
