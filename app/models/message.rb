class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :body_or_image, presence: true

  mount_uploader :image, ImageUploader

  def created_time
    created_at.in_time_zone('Tokyo').strftime("%Y-%m-%d %H:%M:%S")
  end

  private
  def body_or_image
    body.presence || image.presence
  end
end
