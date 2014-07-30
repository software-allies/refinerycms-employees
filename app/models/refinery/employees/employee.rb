module Refinery
  module Employees
    class Employee < Refinery::Core::BaseModel
      self.table_name = 'refinery_employees'
      acts_as_indexed :fields => [:first_name,:last_name]

      attr_accessible :first_name, :last_name, :employee_type, :position, :about, :birthday, :picture_id, :position

      validates :first_name, :presence => true, :uniqueness => true
      validates :last_name, :presence => true


      belongs_to :picture, :class_name => '::Refinery::Image'

    end
  end
end
