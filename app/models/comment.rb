class Comment < ApplicationRecord
 belongs_to :users
 belongs_to :prototype

 validates :text, presence: true
end
