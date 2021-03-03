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
        erb :'/assignments/new'
    end

    post '/assignments' do
        if Assignment.create(title: params[:assignment][:title], content: params[:assignment][:content]).id
            @assignment = Assignment.all.last
            @assignment.teacher_id = current_user.id
            @assignment.save
            redirect "/assignments/#{@assignment.id}"
        end
        redirect '/assignments/new'
    end

    get 'assignmnets/edit' do

    end

    patch '/assignmnets/:id' do

    end

    get '/assignments/:id' do
        if logged_in?
            @assignment = Assignment.find_by_id(params[:id])
            @teacher = Teacher.find_by_id(@assignment.teacher_id)
            erb :'/assignments/show'
        end
        redirect '/teachers/login'
    end
    

end