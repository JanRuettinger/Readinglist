class Book < ActiveRecord::Base

scope :finished, -> { where.not(finished_on: nil)}

  def finished?
    finished_on.present?
  end
end
