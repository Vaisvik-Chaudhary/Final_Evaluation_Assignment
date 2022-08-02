class Nominee < ApplicationRecord
    belongs_to :account
    belongs_to :user
    validates :nominee_name,:percentage, presence: true
    
  
end
