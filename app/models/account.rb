class Account < ApplicationRecord
    belongs_to :user
    has_many :nominees, dependent: :destroy
    accepts_nested_attributes_for :nominees, :allow_destroy => true
    validates :balance, presence: true
    #validate :check_percentage
    
    # private
    # def check_percentage
    #     if nominees.sum(:percentage) >=100
    #       errors.add(:base, :too_long, count: 100)
    #     end
      
    # end
end
