class Assignment < ActiveRecord::Base    
    belongs_to :teacher
    has_many :students_assignments
    has_many :students, through: :song_genres

    validates :title, presence: true
    validates :content, presence: true
   
  end