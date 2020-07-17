class AmusementPark <ApplicationRecord
  validates_presence_of :name, :admission_price
  has_many :rides

  def average_thrill
    rides.average(:thrill_rating)
  end
end
