class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :restrict_with_error

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  before_destroy :check_for_bookmarks

  private

  def check_for_bookmarks
    throw(:abort) if bookmarks.exists?
  end
end
