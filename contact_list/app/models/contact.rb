class Contact < ApplicationRecord

    validates :name, presence: true, length: {maximum: 50}
    validates :phone, presence: true

    #contato pertence a um usuario
    belongs_to :user;
end
