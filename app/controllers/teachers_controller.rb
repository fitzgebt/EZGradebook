class TeacherController < ApplicationController

    get '/teachers' do
      @teachers = Teacher.all
      erb :'/teachers/index'
    end
      
    get '/teachers/:slug' do
      @teacher = teacher.find_by_slug(params[:slug])
      erb :'/teachers/show'
    end
  
end
  