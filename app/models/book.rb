class Book < ActiveRecord::Base

has_many :book_genres
has_many :genres, through: :book_genres

scope :finished, -> { where.not(finished_on: nil)}
scope :recent, ->{ where('finished_on > ?', 2.days.ago) }
scope :search, ->(keyword) { where('keyword LIKE ?', "%#{keyword.downcase}%") if keyword.present?}
scope :filter, ->(name){joins(:genres).where('genres.name = ?', name) if name.present? }


before_save :set_keyword

  def finished?
    finished_on.present?
  end


protected
 def set_keyword
  self.keyword = [title, author, description].map { |p| p.downcase }.join(' ')
 end

 end
