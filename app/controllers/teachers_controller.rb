class TeachersController < ApplicationController

    get '/signup' do
        if logged_in?
            redirect "/teachers/#{current_user.id}"
        else
            erb :'teachers/new'
        end
    end

    post '/signup' do
        if Teacher.create(params).id
            session[:teacher_id] = Teacher.last.id
            @teacher = current_user
            redirect "/teachers/#{current_user.slug}"
        else
            redirect '/signup' 
        end
    end

    get '/login' do
        if logged_in?
            redirect "/teachers/#{current_user.slug}"
        else
            erb :'/teachers/login'
        end
    end

    post '/login' do
        @teacher = Teacher.find_by(username: params[:username])
        if @teacher && @teacher.authenticate(params[:password])
            session[:teacher_id] = @teacher.id
            redirect "/teachers/#{current_user.slug}"
        else
            redirect '/login'
        end
    end

    get '/teachers' do
        if !logged_in?
            redirect '/login'
        end
      @teachers = Teacher.all
      erb :'/teachers/index'
    end

    get '/logout' do
        if !logged_in?
            redirect '/'
        else
            session.clear
            redirect '/'
        end
    end
      
    get '/teachers/:slug' do
        if !logged_in?
            redirect '/login'
        end
        if Teacher.find_by_slug(params[:slug])
            @teacher = Teacher.find_by_slug(params[:slug])
            erb :'/teachers/show'
        else
            @teacher = Teacher.find_by_id(params[:slug])
            erb :'/teachers/show'
        end
    end


  
end
  