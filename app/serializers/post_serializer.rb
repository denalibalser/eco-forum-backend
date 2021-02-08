class PostSerializer < ActiveModel::Serializer 
    attributes :title, :content, :id

    has_many :comments

    def comments 
        self.object.comments.map do |comment|
          {id: comment.id, 
           body: comment.body,
           post_id: comment.post_id}
        end 
    end 
end