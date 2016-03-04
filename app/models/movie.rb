class Movie < ActiveRecord::Base

  CATEGORY_OPTIONS = ['action', 'adventure', 'sci-fi', 'drama', 'romance', 'thriller', 'horror', 'comedy']

  has_many :reviews
  
  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  validates :image,
    presence: true

  validates :category,
    presence: true

  validates :release_date,
    presence: true

  validate :release_date_is_in_the_past

  mount_uploader :image, ImageUploader

  def self.categories
    CATEGORY_OPTIONS
  end


  def movie_rating
    reviews.sum(:rating_out_of_ten) / (reviews.size.nonzero? || 1)
  end

  def self.search(query)
    where("title like ?", "%#{query}%")
  end

  protected

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "This Movie hasn't been release yet.\n Only movies that have been publicly released may be uploaded.") if release_date > Date.today
    end
  end

end
