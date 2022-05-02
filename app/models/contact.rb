class Contact < ApplicationRecord
    validates :name,  length: {minimum:4}
    validates :document, numericality: { only_integer:true, maximum:11 }
    validates :active, :birthday, :email, :mobile, :advertising, presence: true
end
