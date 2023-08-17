class Post < ApplicationRecord
    validates :title, presence: true, 
    validates :post_content, length: {minimum: 250}
    validates :post_summary, length: {minimum: 250}
    validates :post_category, inclusion: {in: ['Fiction', 'Non-Fiction']}

    validate :clickbait_title

    private
  
    def clickbait_title
      unless title =~ /Won't Believe|Secret|Top \d|Guess/
        errors.add(:title, 'is not sufficiently clickbait-y')
      end
    end
end
