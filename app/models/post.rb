class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :title, length: { minimum: 1, maximum: 20 }, uniqueness: true
  validates :body, presence: true, length: { maximum: 100 }
  validate :image_type
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_fill: [200, 200]).processed(:png, :jpg)
  end

  private

  def image_type
    if !image.blob
      errors.add(:image, 'をアップロードしてください')
    elsif !image.blob.content_type.in?(%('image/jpeg image/png'))
      errors.add(:image, 'はJPEGまたはPNG形式を選択してアップロードしてください')
    end
  end

end
