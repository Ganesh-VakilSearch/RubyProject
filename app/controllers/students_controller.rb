class StudentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_student, only: %i[show edit update destroy]

  def index
    @students = Student.all

    @students = @students.where('regno LIKE ?', "%#{params[:regno]}%") if params[:regno].present?

    @students = @students.where('name LIKE ?', "%#{params[:name]}%") if params[:name].present?

    @students = @students.where('dept LIKE ?', "%#{params[:dept]}%") if params[:dept].present?

    @students = @students.order('lower(name)').page(params[:page])

    respond_to do |format|
      format.html

      format.json { render json: { students: @students } }
    end
  end

  def by_dept
    @students = Student.by_dept(params[:department])

    render 'index'
  end

  def new
    @student = Student.new

    respond_to do |format|
      format.html

      format.json { render json: { student: @student } }
    end
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

      CrudNotificationMailer.create_not(@student).deliver_now

      redirect_to students_path

    else

      render :new

    end
  end

  def show
    respond_to do |format|
      format.html

      format.json { render json: { student: @student } }
    end
  end

  def edit
    respond_to do |format|
      format.html

      format.json { render json: { student: @student } }
    end
  end

  def update
    if @student.update(student_params)

      CrudNotificationMailer.update_not(@student).deliver_now

      # redirect_to students_path shows the index page of all details

      redirect_to student_path(@student) # redirects to show details page

    else

      render :edit

    end
  end

  def destroy
    CrudNotificationMailer.delete_not(@student).deliver_now

    @student.destroy

    redirect_to students_path
  end

  private

  def student_params
    params.require(:student).permit(:name, :regno, :email, :phonenumber, :dept, :date_of_birth, :profile_image)
  end

  # Use callbacks to share common setup or constraints between actions.

  def set_student
    @student = Student.find(params[:id])
  end
end
