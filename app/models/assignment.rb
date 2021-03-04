class Assignment < ActiveRecord::Base    
    belongs_to :teacher
    has_many :assignments_students
    has_many :students, through: :assignments_students

    validates :title, presence: true
    validates :content, presence: true
   
  end