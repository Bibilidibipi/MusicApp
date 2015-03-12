class Album < ActiveRecord::Base
  validates :name, presence: true
  validates :recording_type, inclusion: %w(live studio)
  validates :band_id, presence: true, uniqueness: { scope: :name }

  belongs_to :band
  has_many :tracks, dependent: :destroy
end
