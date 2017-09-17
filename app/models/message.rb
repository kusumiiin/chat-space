class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :body, presence: true

  mount_uploader :image, ImageUploader

  def created_time
    created_at.in_time_zone('Tokyo').strftime("%Y-%m-%d %H:%M:%S")
  end

end
