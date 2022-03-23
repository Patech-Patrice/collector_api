class Shoe < ApplicationRecord
    validates :name, presence: true, length: { minimum: 1 }
    validates :designer, presence: true, length: { minimum: 1 }
end
