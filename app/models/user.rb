class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
  has_many :notes

  validates :name, presence: true, length: { maximum: 35 }

  before_validation :set_name, on: :create

  private

  def set_name
    self.name = "Guest №#{rand(50)}" if self.name.blank?
  end
end
