class TeachersController < ApplicationController

    get '/signup' do
        if logged_in?
            redirect '/teachers/#{current_user.id}'
        end
        erb :'teachers/new'
    end

    post '/signup' do
        if Teacher.create(params).id
            session[:teacher_id] = Teacher.last.id
            @teacher = current_user.id
            redirect '/teachers/#{current_user.id}'
        end
        redirect '/signup' 
    end

    get '/login' do
        if logged_in?
            redirect '/teachers/#{current_user.id}'
        end
        erb :'/teachers/login'
    end

    post '/login' do
        binding.pry
        @teacher = Teacher.find_by(username: params[:username])
        if @teacher && @teacher.authenticate(params[:password])
            session[:teacher_id] = @teacher.id
            redirect '/teachers/#{current_user.id}'
        end
        redirect '/login'
    end

    get '/teachers' do
      @teachers = Teacher.all
      erb :'/teachers/index'
    end

    get '/logout' do
        if !logged_in?
            redirect '/'
        end
        session.clear
        redirect '/'
    end
      
    get '/teachers/:id' do
        if logged_in?
            @teacher = Teacher.find_by_id(params[:id])
            erb :'/teachers/show'
        end
        redirect '/login'
    end


  
end
  