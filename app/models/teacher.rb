class Teacher < ActiveRecord::Base
    has_secure_password
    has_many :assignments 
    has_many :students_assignments
    has_many :students, through: :students_assignments
  
    validates :username, presence: true, uniqueness: true
    validates :fname, presence: true
    validates :lname, presence: true
    validates :password, presence: true
  
    def slug
      fullname=self.fname + " " + self.lname
      fullname.downcase.gsub(" ", "-")
    end
    
    def self.find_by_slug(arg)
      if self.all.find {|s| s.slug == arg}
        self.all.find {|s| s.slug == arg}
      else 
        arg = arg.downcase.gsub(" ", "-")
        self.all.find {|s| s.slug == arg}
      end
    end
  end
  