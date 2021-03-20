class Passenger < ApplicationRecord
  belongs_to :booking
  
  before_save :normalize_name
  before_save :email_downcase
  
  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)\z/, message: "Invalid" }

  
  private
  def normalize_name
    self.name = name.downcase.titleize
  end

  def email_downcase
    self.email = email.downcase
  end
end
