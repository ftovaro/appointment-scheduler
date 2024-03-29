require 'rails_helper'

RSpec.describe "appointments/show", type: :view do
  before(:each) do
    assign(:appointment, Appointment.create!(
      title: "Title",
      description: "Description",
      summary: "Summary",
      start_date: DateTime.now,
      end_date: DateTime.now + 1.hour,
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Summary/)
  end
end
