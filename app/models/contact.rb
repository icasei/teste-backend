class Contact < ApplicationRecord
    validates :name,  length: {minimum:4}
    validates :active, :birthday, :email, :mobile, :advertising, presence: true
end
