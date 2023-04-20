class Student < ApplicationRecord
  validates :name, :regno, :email, :phonenumber, :dept, :date_of_birth, presence: true
  validates :email, :phonenumber, uniqueness: true
  validates :name, format: { with: /|A[a-zA-Z]+\z/, message: 'only letters are allowed' }
  validate :validate_student_age
  # before_create :greeting_message

  # def greeting_message
  #     puts "Hey! I will run before you create an object"
  # end
  #   after_create :display_student_age

  #   def display_student_age
  #     if date_of_birth.present?
  #       age = Date.today.year - date_of_birth.year
  #       puts "===================Age of the student is #{age}=================="
  #     else
  #       puts 'Age cannot be calculated without date_of_birth'
  #     end
  #   end
  # end

  scope :by_dept, ->(dept_name) { where(dept: dept_name) }

  def validate_student_age
    return unless date_of_birth.present?

    age = Date.today.year - date_of_birth.year
    return unless age < 18

    errors.add(:age, 'Please provide a valid date of birth here.Age must be greater than 18')
  end
end
