class StudentsController < ApplicationController
    get '/students' do
        if !logged_in?
            redirect '/login'
        end
        @students = Student.all
        erb :'/students/index'
    end

    get '/students/:slug' do
        @student = Student.find_by_slug(params[:slug])
        @assignments = Assignment.all
        erb :'/students/show'
    end
end