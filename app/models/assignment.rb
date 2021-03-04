class Assignment < ActiveRecord::Base    
    belongs_to :teacher
    has_many :assignments_students
    has_many :students, through: :assignments_students

    validates :title, presence: true
    validates :content, presence: true
   
    def slug
      fullname=self.fname + " " + self.lname
      fullname.downcase.gsub(" ", "-")
      end
      
      def self.find_by_slug(slug)
        self.all.find {|s| s.slug == slug}
      end
  end