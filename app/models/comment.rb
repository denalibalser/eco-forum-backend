class Comment < ApplicationRecord
  belongs_to :post
  validates :body, presence: true, allow_blank: false
  validates :post_id, presence: true

end
