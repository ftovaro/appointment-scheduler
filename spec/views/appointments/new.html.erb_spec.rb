require 'rails_helper'

RSpec.describe "appointments/new", type: :view do
  before(:each) do
    assign(:appointment, Appointment.new(
      title: "MyString",
      description: "MyString",
      summary: "MyString",
      start_date: DateTime.now,
      end_date: DateTime.now + 1.hour,
    ))
  end

  xit "renders new appointment form" do
    render

    assert_select "form[action=?][method=?]", appointments_path, "post" do

      assert_select "input[name=?]", "appointment[title]"

      assert_select "input[name=?]", "appointment[description]"

      assert_select "input[name=?]", "appointment[summary]"
    end
  end
end
