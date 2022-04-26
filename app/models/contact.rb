class Contact < ApplicationRecord
    validates :name,  length: {minimum:4}
    validates :active, :birthday, :email, :mobile, :advertising, :cpfcnpj, presence: true
    validates :cpfcnpj, length: { in: 11..14 }
    validates :cpfcnpj, format: { with: /\A\d+\z/, message: "only allows numbers" }
end
