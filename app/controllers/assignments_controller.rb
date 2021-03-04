class AssignmentsController < ApplicationController

    get '/assignments' do
        if !logged_in?
            redirect '/login'
        end        
        @assignments = Assignment.all
        erb :'/assignments/index'
    end

    
    get '/assignments/new' do 
        if !logged_in?
            redirect '/login'
        end 
            @students = Student.all
            erb :'/assignments/new'
    end

    post '/assignments' do
        if Assignment.create(title: params[:assignment][:title], content: params[:assignment][:content]).id
            assignment = Assignment.all.last
            assignment.teacher_id = current_user.id
            students = Student.all
            students.each do |student|
                AssignmentsStudent.create(assignment_id: assignment.id, student_id: student.id)
            end
            assignment.assignments_students.each do |assignment_student|
                assignment_student.update(grade: params[:students][assignment_student.student_id.to_s][:grade])
            end           
            assignment.save
            redirect "/assignments/#{assignment.id}"
        else
            redirect '/assignments/new'
        end
    end

    get '/assignments/:id/edit' do
        if !logged_in?
            redirect '/login'
        end   
        @assignment = Assignment.find_by_id(params[:id])
        @students = Student.all
        if @assignment.teacher_id == current_user.id
            erb :'/assignments/edit'
        else
            redirect '/assignments'
        end
         
    end

    get '/assignments/:id' do
        if !logged_in?
            redirect '/teachers/login'
        end
        @assignment = Assignment.find_by_id(params[:id])
        @teacher = Teacher.find_by_id(@assignment.teacher_id)
        erb :'/assignments/show'
    end

    patch '/assignments/:id' do
        if !logged_in?
            redirect '/login'
        end
        assignment = Assignment.find_by_id(params[:id])
        if params[:assignment][:content] == "" || params[:assignment][:title] == ""
            redirect "assignments/#{assignment.id}/edit"
        else
            assignment.update(title: params[:assignment][:title], content: params[:assignment][:content])         
            assignment.assignments_students.each do |assignment_student|
                assignment_student.update(grade: params[:students][assignment_student.student_id.to_s][:grade])
            end           
            redirect "/assignments/#{assignment.id}"
        end
    end

    delete '/assignments/:id' do
        if !logged_in?
            redirect '/login'
        end
        assignment = Assignment.find_by_id(params[:id])
        if current_user.id == assignment.teacher_id
            assignment.destroy
            redirect "/teachers/#{current_user.slug}"
        else
        redirect "/teachers/#{current_user.slug}"
        end
    end

end
