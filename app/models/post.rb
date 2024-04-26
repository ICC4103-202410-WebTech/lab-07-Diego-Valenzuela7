class Post < ApplicationRecord
    belongs_to :user
    has_many :post_tags
    has_many :tags, through: :post_tags
    belongs_to :parent_post, class_name: "Post", optional: true
    has_many :sub_posts, class_name: "Post", foreign_key: "parent_post_id"
  
    validates :title, presence: { message: "Your post must have a title." }
    validates :content, presence: { message: "You can't publish an empty post." }
    validates :user_id, presence: { message: "A post must have an associated user." }
    validates :answers_count, numericality: { greater_than_or_equal_to: 0, message: "You can't have a negative number of answers." }
    validates :likes_count, numericality: { greater_than_or_equal_to: 0, message: "You can't have a negative number of likes." }
  
    before_validation :set_published_at
    before_save :sanitize_content
  
    def set_published_at
      self.published_at ||= Time.current
    end
  
    def sanitize_content
      self.content = ActionController::Base.helpers.sanitize(content)
    end
  end