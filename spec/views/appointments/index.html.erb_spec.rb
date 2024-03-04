require 'rails_helper'

RSpec.describe "appointments/index", type: :view do
  before(:each) do
    assign(:appointments, [
      Appointment.create!(
        title: "Title",
        description: "Description",
        summary: "Summary",
        start_date: DateTime.now,
        end_date: DateTime.now + 1.hour,
      ),
      Appointment.create!(
        title: "Title",
        description: "Description",
        summary: "Summary",
        start_date: DateTime.now,
        end_date: DateTime.now + 1.hour,
      )
    ])
  end

  xit "renders a list of appointments" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Summary".to_s), count: 2
  end
end
