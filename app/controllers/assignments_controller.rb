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
            erb :'/assignments/new'
        end
    end

    post '/assignments' do
        if Assignment.create(title: params[:assignment][:title], content: params[:assignment][:content]).id
            @assignment = Assignment.all.last
            @assignment.teacher_id = current_user.id
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
            redirect "/teachers/#{current_user.id}"
        else
        redirect "/teachers/#{current_user.id}"
        end
    end

end