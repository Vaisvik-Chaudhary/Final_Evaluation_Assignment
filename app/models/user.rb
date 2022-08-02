class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_one :account
has_many :nominees
after_commit :create_account, on: :create

  private

  def create_account
    Account.create!(user_id: self.id)
  end
end
