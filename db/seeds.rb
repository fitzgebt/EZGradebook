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
    "Student9" => {
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

@teachers_list = {
    "Teacher2" => {
      username: "fitzgeralds",
      fname: "Sophia",
      lname: "Fitzgerald",
      password: "fitzgeralds"
    },
    "Teacher3" => {
      username: "lewisf",
      fname: "Frank",
      lname: "Lewis",
      password: "lewisf"
    },
    "Teacher4" => {
      username: "valenzuelam",
      fname: "Maria",
      lname: "Valenzuela",
      password: "valenzuelam"
    }
  }

@teachers_list.each do |teacher, teacher_hash|
  Teacher.create(teacher_hash)
end


# Assignment Seed Below

assignment_list = {
    "Assignment1" => {
      title: "Essay: Black History Month",
      content: "Choose one of the historical figues that was discussed during our Black History Month Lectures. Two page minimum requirement.",
      teacher_id: Teacher.last.id
    },
    "Assignment2" => {
      title: "Indefinite Integrals",
      content: "In this section we definition and properties of indefinite integrals. Complete chapter 14 questions 1-6, 7a-7c.",
      teacher_id: Teacher.all[1].id
    },
    "Assignment3" => {
      title: "Self Portrait",
      content: "Complete your self portiat in the medium of your choice. Selfies, however, are not acceptable for this assignment.",
      teacher_id: Teacher.first.id
    }
   
  }

assignment_list.each do |name, assignment_hash|
  p = Assignment.create(assignment_hash)
end

Assignment.all.each do |assignment|
  rand_grade = ["A","B","C","D","F"]
  Student.all.each do |student|
    if !AssignmentsStudent.find_by(assignment_id: assignment.id, student_id: student.id)
      AssignmentsStudent.create(assignment_id: assignment.id, student_id: student.id, grade: rand_grade.sample)
    end
  end
end