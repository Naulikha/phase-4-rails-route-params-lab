class StudentsController < ApplicationController
    def index
      if params[:name]
        # Find students whose first or last name matches the query parameter
        students = Student.where("LOWER(first_name) LIKE LOWER(:query) OR LOWER(last_name) LIKE LOWER(:query)", query: "%#{params[:name]}%")
      else
        # Retrieve all students if no query parameter is provided
        students = Student.all
      end
  
      render json: students
    end
  
    def show
      student = Student.find(params[:id])
      render json: student
    end 


end
