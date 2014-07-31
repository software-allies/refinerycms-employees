module Refinery
  module Employees
    class Employee < Refinery::Core::BaseModel
      self.table_name = 'refinery_employees'

      attr_accessible :first_name, :last_name, :employee_type, :position, :about, :birthday, :picture_id, :position

      acts_as_indexed :fields => [:first_name, :last_name, :employee_type, :position, :about]

      validates :first_name, :last_name, :picture_id, :position, :about , :presence => true

      belongs_to :picture, :class_name => '::Refinery::Image'
    end
  end
end
