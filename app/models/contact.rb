class Contact < ApplicationRecord
    validates :name,  length: {minimum:4}
    validates :active, :birthday, :email, :mobile, :advertising, presence: true
    validates :active, :birthday, :email, :cpf_cnpj, :mobile, :advertising, presence:true
end
