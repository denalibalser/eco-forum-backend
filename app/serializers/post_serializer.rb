class PostSerializer < ActiveModel::Serializer #added Api::V1:: 
    attributes :title, :content, :id

    has_many :comments
    # def serializable_hash(adapter_options = nil, options = {}, adapter_instance = self.class.serialization_adapter_instance)
    #     hash = super
    #     hash.each { |key, value| hash.delete(key) if value.nil? }
    #     hash
    # end

    def comments 
        self.object.comments.map do |comment|
          {id: comment.id, 
           body: comment.body,
           post_id: comment.post_id}
        end 
    end 
end