class Patient < ApplicationRecord
    has_many :appointments
    has_many :waiting_list_items
end
#comentario branch gonza