# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Employees" do
    describe "Admin" do
      describe "employees" do
        login_refinery_user

        describe "employees list" do
          before do
            FactoryGirl.create(:employee, :first_name => "UniqueTitleOne")
            FactoryGirl.create(:employee, :first_name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.employees_admin_employees_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.employees_admin_employees_path

            click_link "Add New Employee"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "First Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Employees::Employee.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("First Name can't be blank")
              Refinery::Employees::Employee.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:employee, :first_name => "UniqueTitle") }

            it "should fail" do
              visit refinery.employees_admin_employees_path

              click_link "Add New Employee"

              fill_in "First Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Employees::Employee.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:employee, :first_name => "A first_name") }

          it "should succeed" do
            visit refinery.employees_admin_employees_path

            within ".actions" do
              click_link "Edit this employee"
            end

            fill_in "First Name", :with => "A different first_name"
            click_button "Save"

            page.should have_content("'A different first_name' was successfully updated.")
            page.should have_no_content("A first_name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:employee, :first_name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.employees_admin_employees_path

            click_link "Remove this employee forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Employees::Employee.count.should == 0
          end
        end

      end
    end
  end
end
