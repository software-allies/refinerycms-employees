class CreateEmployeesEmployees < ActiveRecord::Migration

  def up
    create_table :refinery_employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :employee_type
      t.string :position
      t.text :about
      t.date :birthday
      t.integer :picture_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-employees"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/employees/employees"})
    end

    drop_table :refinery_employees

  end

end
