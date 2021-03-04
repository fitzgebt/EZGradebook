class AssignmentsController < ApplicationController

    get '/assignments' do
        if !logged_in?
            redirect '/login'
        else
            @assignments = Assignment.all
            erb :'/assignments/index'
        end
    end

    
    get '/assignments/new' do 
        if !logged_in?
            redirect '/login'
        else
            @students = Student.all
            erb :'/assignments/new'
        end
    end

    post '/assignments' do
        if Assignment.create(title: params[:assignment][:title], content: params[:assignment][:content]).id
            @assignment = Assignment.all.last
            @assignment.teacher_id = current_user.id
            @students = Student.all
            @students.each do |student|
                params[:students][:grade].each do |grade|
                    if !AssignmentsStudent.find_by(assignment_id: @assignment.id, student_id: student.id)
                        join_table_obj = AssignmentsStudent.create(assignment_id: @assignment.id, student_id: student.id, grade: grade)
                    end
                end
            end
            @assignment.save
            redirect "/assignments/#{@assignment.id}"
        else
            redirect '/assignments/new'
        end
    end

    get '/assignments/:id/edit' do
        if !logged_in?
            redirect '/login'
        end   
        @assignment = Assignment.find_by_id(params[:id])
        @students = Students.all
        if @assignment.teacher_id == current_user.id
            erb :'/assignments/edit'
        else
            redirect '/assignments'
        end
         
    end

    get '/assignments/:id' do
        if logged_in?
            @assignment = Assignment.find_by_id(params[:id])
            @teacher = Teacher.find_by_id(@assignment.teacher_id)
            @students = Student.all
            erb :'/assignments/show'
        else
            redirect '/teachers/login'
        end
    end

    patch '/assignments/:id' do
        if !logged_in?
            redirect '/login'
        end
        @assignment = Assignment.find_by_id(params[:id])
        if params[:assignment][:content] == "" || params[:assignment][:title] == ""
            redirect "assignments/#{@assignment.id}/edit"
        else
            binding.pry
            @assignment.update(title: params[:assignment][:title], content: params[:assignment][:content])
            binding.pry
            @assignment.students.grades.update(params[:student])
            redirect "/assignments/#{@assignment.id}"
        end
    end

    delete '/assignments/:id' do
        if !logged_in?
            redirect '/login'
        end
        @assignment = Assignment.find_by_id(params[:id])
        if current_user.id == @assignment.teacher_id
            @assignment.destroy
            redirect "/teachers/#{current_user.slug}"
        else
        redirect "/teachers/#{current_user.slug}"
        end
    end

end