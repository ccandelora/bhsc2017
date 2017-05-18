class ReservationWeek < ActiveRecord::Base
	has_many :reservations
  has_many :users, :through => :reservations

  validates :res_date,  presence: true, uniqueness: true, :on => :create
end
