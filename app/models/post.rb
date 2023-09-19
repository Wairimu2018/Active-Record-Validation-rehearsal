class Post < ApplicationRecord
    # validate title and body
    validates :title, presence: true
    # validate that the title has a length of at-least 5
    validates :title, length: { minimum: 5, maximum: 7}
    # validates :title, length: {maximum: 7}
    #  custom validator with all caps title

    validate :title_must_be_all_caps

    validates :body, presence: true
    validates :body, length: { minimum: 10}

    # Validate uniqueness

    validates :title, uniqueness: true
    validates :body, uniqueness: true

    private 

    def title_must_be_all_caps
        # if the title is not all caps, add an aerror
        unless title == title.upcase
            errors.add(:title, "must be in all caps")
        end
    end
end
