class TeachersController < ApplicationController

    get '/signup' do
        if logged_in?
            redirect '/assignments'
        end
        erb :'teachers/new'
    end

    post '/signup' do
        if Teacher.create(params).id
            session[:teacher_id] = Teacher.last.id
            redirect '/assignments'
        end
        redirect '/signup' 
    end

    get '/teachers' do
      @teachers = Teacher.all
      erb :'/teachers/index'
    end
      
    get '/teachers/:slug' do
      @teacher = teacher.find_by_slug(params[:slug])
      erb :'/teachers/show'
    end


  
end
  