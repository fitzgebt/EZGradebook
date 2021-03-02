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
        if Assignment.create(params).id
            @assignment = Assignment.all.last
            @assignment.teacher_id = current_user.id
            @assignment.save
            redirect '/assignments/#{@assignment.id}'
        end
        redirect '/assignments/new'
    end
    

end