class ChangeCpfCnpjToBeStringInContacts < ActiveRecord::Migration[7.0]
  def change
    change_column :Contacts, :cpf_cnpj, :string
  end
end
