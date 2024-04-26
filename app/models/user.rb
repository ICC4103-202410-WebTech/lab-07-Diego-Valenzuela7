class User < ApplicationRecord
    has_many :posts


    validates :name, presence: { message: "Please provide your name." }
    validates :email, presence: { message: "We need your email address." }, 
                    uniqueness: { message: "This email is already registered. Please use a different one." }, 
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "Please enter a valid email address." }
    validates :password, presence: { message: "A password is required." },
             length: { minimum: 6, message: "Your password must be at least 6 characters long." }

  
    before_save :downcase_email

    private


    def downcase_email
        self.email = email.downcase
    end
end