class StudentsController < ApplicationController

  before_action :set_student, only: %i[show edit update destroy]



  def index

    # @students =Student.order(:name).distinct(:name)



    # @students = Student.all



    @students = if params[:regno].present?



                  Student.where('regno LIKE ?', "%#{params[:regno]}%")



                elsif params[:name].present?



                  @students = Student.where('name LIKE ?', "%#{params[:name]}%")



                elsif params[:dept].present?



                  @students = Student.where('dept LIKE ?', "%#{params[:dept]}%")



                else



                  Student.all.order('lower(name)').page(params[:page])



                end

  end



  def by_dept

    @students = Student.by_dept(params[:department])



    render 'index'

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



  def show; end



  def edit; end



  def update

    if @student.update(student_params)



      # redirect_to students_path shows the index page of all details



      redirect_to student_path(@student) # redirects to show details page



    else



      render :edit



    end

  end



  def destroy

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

