class StudentsController < ApplicationController
  def index
    # @students =Student.order(:name).distinct(:name)

    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    #   name: params[:student][:name],

    #   regno: params[:student][:regno],

    #   email: params[:student][:email],

    #   phonenumber: params[:student][:phonenumber],

    #   dept: params[:student][:dept],

    #   date_of_birth: params[:student][:date_of_birth]

    # )

    if @student.save

      redirect_to students_path

    else

      render :new

    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)

      # redirect_to students_path shows the index page of all details

      redirect_to student_path(@student) # redirects to show details page
    else
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path
  end

  private

  def student_params
    params.require(:student).permit(:name, :regno, :email, :phonenumber, :dept, :date_of_birth)
  end
end
