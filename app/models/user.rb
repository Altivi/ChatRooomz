class User < ActiveRecord::Base
	
	has_secure_password
	has_many :comments, dependent: :destroy
	has_many :rooms 						#for opportunity to be room creator
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }

  	
	######################################################

	before_save :downcase_email
	
	######################################################

	validates :name,     presence: true, 
					     length: { maximum: 50 }
 	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email,    presence: true, 
					     length: { maximum: 255 }, 
					     format: { with:  VALID_EMAIL_REGEX }, 
					     uniqueness: { case_sensitive: false }
  	validates :password, presence: true, 
  					     length: { minimum: 6 }, 
  					     allow_nil: true
  	validates :avatar, attachment_presence: true
  	validates_attachment_content_type :avatar,
 						 content_type: /\Aimage\/.*\Z/,
 						 presence: true


  	private

	    def downcase_email
	      self.email = email.downcase
	    end
end
