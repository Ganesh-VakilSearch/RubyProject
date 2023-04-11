class Student < ApplicationRecord
    validates :name,:regno,:email,:phonenumber,:dept,:date_of_birth,presence: true
end
