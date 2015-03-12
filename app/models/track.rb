class Track < ActiveRecord::Base
  validates :name, :bonus, presence: true
  validates :album_id, presence: true, uniqueness: { scope: :name }

  belongs_to :album
end
