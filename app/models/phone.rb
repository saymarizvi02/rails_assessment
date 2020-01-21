class Phone < ApplicationRecord
    validates :phone_number, presence: true,
end
