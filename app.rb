require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, { adapter: "sqlite3", database: "mydb.db" }
require './models/student'
require './models/college_class'
require './models/student_class'


get '/' do
    @students = Student.all
    @college_class = CollegeClass.all
    @student_class = StudentClass.all
    
    erb :students
    
end

get '/student/:id' do
   @student= Student.find(params[:id])
   if @student.nil?
       return "student not found"
   end
   erb :student
end

get '/classes/:id' do
    @classes = CollegeClass.find(params[:id])
    if @classes.nil?
        return "class not found"
    end
    erb :classes
end

