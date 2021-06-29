class User < ApplicationRecord
    has_many :posts

    validates :first_name, :last_name, :favorite_language, presence: true

    # creating a custom instance method. self refers to the ActiveRecord object
    def full_name
        "#{self.first_name} #{self.last_name}"
    end
end
