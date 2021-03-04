class Student < ActiveRecord::Base
    has_many :assignments_students
    has_many :assignments, through: :assignments_students
    has_many :teachers, through: :assignments

    validates :fname, presence: true
    validates :lname, presence: true
    

    def slug
      fullname=self.fname + " " + self.lname
      fullname.downcase.gsub(" ", "-")
      end
      
      def self.find_by_slug(slug)
        self.all.find {|s| s.slug == slug}
      end

end