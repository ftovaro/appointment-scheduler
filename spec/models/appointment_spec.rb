require 'rails_helper'

RSpec.describe Appointment, type: :model do
  # describe 'validations' do
  #   let!(:existing_appointment) { Appointment.create(start_date: '2024-03-10 10:00', end_date: '2024-03-10 11:00') }

  #   context 'when new appointment exactly overlaps with existing one' do
  #     let(:new_appointment) { Appointment.new(start_date: '2024-03-10 10:00', end_date: '2024-03-10 11:00') }

  #     it 'is not valid' do
  #       expect(new_appointment.valid?).to be false
  #       expect(new_appointment.errors[:base]).to include("Appointment overlaps with an existing one.")
  #     end
  #   end



  xit "fills the summary" do
    title = "My title"
    start_date = DateTime.new(2024, 03, 03, 10, 00, 00, '-5')
    end_date = start_date + 1.hour
    app = Appointment.create(title: title,  start_date: start_date, end_date: end_date)
    expect(app.summary).to eq("My title - March 3rd, 2024, 10:00 AM to 11:00 AM")
  end

  it "doesn't allow to overlap appointments" do
    start_date = DateTime.new(2024, 03, 03, 10, 00, 00, '-5')
    end_date = start_date + 4.hour
    app = Appointment.create(start_date: start_date, end_date: end_date)
    overlapping_start_date = DateTime.new(2024, 03, 03, 11, 00, 00, '-5')
    overlapping_end_date = start_date + 4.hour
    overlapping_app = Appointment.new(start_date: overlapping_start_date, end_date: overlapping_end_date)
    expect(overlapping_app).not_to be_valid
  end

  it "doesn't allow end date to be less than start date" do
    start_date = DateTime.new(2024, 03, 03, 10, 00, 00, '-5')
    end_date = start_date - 4.hour
    app = Appointment.create(start_date: start_date, end_date: end_date)
    expect(app).not_to be_valid
  end
end
