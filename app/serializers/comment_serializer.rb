class CommentSerializer < ActiveModel::Serializer #added Api::V1:: 
    attributes :id, :body, :post_id

    belongs_to :post
end