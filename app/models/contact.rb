class Contact < ApplicationRecord
    validates :name,  length: {minimum:4}, presence: true
    validates :active, :birthday, :email, :mobile, :advertising, presence: true
    validates :cpf_cnpj, format: {with: /\A\d+\z/, message: "only numbers"}, length: { in: 11..14 }, presence: true
end