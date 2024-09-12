class Comment < ApplicationRecord
  belongs_to :page, foreign_key: 'pages_id'
end
