class Tag < ApplicationRecord
    has_many :post_tags
    has_many :posts, through: :post_tags

    validates :name, presence: { message: "Please provide a name for the tag." },
                   uniqueness: { message: "This tag already exists. Please use a different one." }


    before_validation :downcase_name

    private

  
    def downcase_name
      self.name = name.downcase
    end
end
  