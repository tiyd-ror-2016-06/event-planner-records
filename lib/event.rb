class Event < ActiveRecord::Base
  validates_presence_of :title, :date, :zip
  validates_length_of :zip, is: 5
  validate :date_cant_be_in_the_past

  def date_cant_be_in_the_past
    if date.present? && date < Date.today
      errors.add :date, "can't be in the past"
    end
  end
end
