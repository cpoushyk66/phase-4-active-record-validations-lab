class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, { :length => { :minimum => 250 } }
    validates :summary, { :length => { :maximum => 250 } }
    validates :category, { :inclusion => {in: %w(Fiction Non-Fiction)}}
    validate :click_baity



    
    def click_baity

        if (title != nil && !(["Won't Believe", "Secret", "Top [number]", "Guess"].any? { |check| title.include?(check) })) 
            errors.add(:title, "Sorry, not click baity enough!")
        end
    end


    
end
