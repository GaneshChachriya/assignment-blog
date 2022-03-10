class Article < ApplicationRecord
    belongs_to :user
    has_many :comments dependent: :destroy
    validates :title, presence: true, length: {minimum: 6, maximum: 100}
    validates :Description, presence: true, length: {minimum: 10, maximum: 500}
end
