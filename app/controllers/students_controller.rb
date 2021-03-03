class StudentsController < ApplicationController
    get '/students' do
        @students = Student.all
        erb :'/students/index'
    end

    get '/students/slug' do
        @student = Student.find_by_slug(params[:slug])
        erb :'/students/show'
    end
end