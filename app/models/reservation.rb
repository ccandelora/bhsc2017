class Reservation < ActiveRecord::Base
	belongs_to :user
  belongs_to :reservation_week

  validates :reservation_date, :name, :sex, :res_member_type,  presence: true
  validate :res_date_cannot_be_in_the_past

  def res_date_cannot_be_in_the_past
  	errors.add(:reservation_date, 'Reservations for the week are closed! You can not Edit or Save!') if reservation_date < Date.today
  end
end
