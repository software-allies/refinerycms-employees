module Refinery
  module Employees
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Employees

      engine_name :refinery_employees

      initializer "register refinerycms_employees plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "employees"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.employees_admin_employees_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/employees/employee',
            :title => 'first_name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Employees)
      end
    end
  end
end
