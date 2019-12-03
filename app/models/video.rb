class Video < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :url, :count_view
end
