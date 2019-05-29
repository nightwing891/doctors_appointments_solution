class Doctor < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments

  def dr_name
    "Dr. #{self.last_name}"
  end
end
