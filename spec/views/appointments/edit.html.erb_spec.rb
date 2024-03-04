require 'rails_helper'

RSpec.describe "appointments/edit", type: :view do
  let(:appointment) {
    Appointment.create!(
      title: "MyString",
      description: "MyString",
      summary: "MyString",
      start_date: DateTime.now,
      end_date: DateTime.now + 1.hour,
    )
  }

  before(:each) do
    assign(:appointment, appointment)
  end

  xit "renders the edit appointment form" do
    render

    assert_select "form[action=?][method=?]", appointment_path(appointment), "post" do

      assert_select "input[name=?]", "appointment[title]"

      assert_select "input[name=?]", "appointment[description]"

      assert_select "input[name=?]", "appointment[summary]"
    end
  end
end
