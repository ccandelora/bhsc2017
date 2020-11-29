class Reservation < ActiveRecord::Base
	belongs_to :user
  belongs_to :reservation_week

  validates :reservation_date, :name, :sex, :res_member_type,  presence: true
  validate :res_date_cannot_be_in_the_past

  has_many :guests
  accepts_nested_attributes_for :guests


  def res_date_cannot_be_in_the_past
  	errors.add(:reservation_date, 'Reservations for the week are closed! You can not Edit or Save!') if reservation_date + 1.day < Date.today
  end
end
