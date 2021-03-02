class Teacher < ActiveRecord::Base
    has_secure_password
    has_many :assignments 
    has_many :students_assignments
    has many :students, through: :students_assignments
  
    validates :username, presence: true
    validates :email, presence: true
  
    def slug
      self.username.downcase.gsub(" ", "-")
    end
    
    def self.find_by_slug(slug)
      self.all.find {|s| s.slug == slug}
    end
  end
  