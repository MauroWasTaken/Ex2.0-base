class Comment < ActiveRecord::Base
    belongs_to :author, class_name: 'Client'
    belongs_to :target, polymorphic: true
end 