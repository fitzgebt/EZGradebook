students_list = {
    "Student1" => {
      fname: "Brendan",
      lname: "Fitzgerald"
    },
    "Student2" => {
      fname: "Thomas",
      lname: "Tankengine"
    },
    "Student3" => {
      fname: "Charles",
      lname: "Barkley"
    },
    "Student4" => {
      fname: "Dillon",
      lname: "Mark"
    },
    "Student5" => {
      fname: "Subway",
      lname: "Eatfresh"
    },
    "Student6" => {
      fname: "Sophie",
      lname: "Turner"
    },
    "Student7" => {
      fname: "Shea",
      lname: "Butter"
    },
    "Student8" => {
      fname: "Hermione",
      lname: "Granger"
    },
    "Student8" => {
      fname: "Class",
      lname: "Clown"
    }
  }

students_list.each do |student, name_hash|
  p = Student.new
  name_hash.each do |attribute, value|
    p[attribute] = value
  end
  p.save
end

# teachers_list = {
#     "Teacher1" => {
#       username: "fitzgeraldb",
#       fname: "Brendan",
#       lname: "Fitzgerald",
#       password_digest: "fitzgeraldb1"
#     },
#     "Teacher2" => {
#       username: "fitzgeralds",
#       fname: "Sophia",
#       lname: "Fitzgerald",
#       password_digest: "fitzgeralds1"
#     },
#     "Teacher3" => {
#       username: "lewisf",
#       fname: "Frank",
#       lname: "Lewis",
#       password_digest: "lewisf1"
#     }
#   }

# teachers_list.each do |teacher, teacher_hash|
#   p = Teacher.new
#     teacher_hash.each do |attribute, value|
#       p[attribute] = value
#     end
#   p.save
# end


# title_list = {
#     "The Mayor" => {
#     },
#     "The Don" => {
#     },
#     "Mr. President" => {
#     }
#   }

# title_list.each do |name, figure_hash|
#   p = Title.new
#   p.name = name
#   p.save
# end