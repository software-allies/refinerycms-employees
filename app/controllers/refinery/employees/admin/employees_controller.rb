module Refinery
  module Employees
    module Admin
      class EmployeesController < ::Refinery::AdminController

        crudify :'refinery/employees/employee',
                :title_attribute => 'first_name', :xhr_paging => true

      end
    end
  end
end
