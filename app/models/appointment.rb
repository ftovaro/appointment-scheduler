class Appointment < ApplicationRecord
  before_save :set_summary

  validate :overlap
  validate :check_start_before_end

  private

  def set_summary
    # Meeting with Team - March 3rd, 2024, 10:00 AM to 11:00 AM
    month_section = "#{start_date.strftime("%B")} #{start_date.day.ordinalize}"
    year_section = "#{start_date.strftime("%Y")}"
    time_section = "#{start_date.strftime("%H:%M %p")} to #{end_date.strftime("%H:%M %p")}"
    summary = "#{title} - #{month_section}, #{year_section}, #{time_section}"
    self.summary = summary
  end

  def check_start_before_end
    errors.add(:start_date, 'must be before end date') if start_date > end_date
  end

  def overlap
    overlapping_appointments = Appointment.where.not(id: id).where('start_date < ? AND end_date > ?', end_date, start_date)

    if overlapping_appointments.exists?
      errors.add(:base, "The appointments overlaps with: #{overlapping_appointments.pluck(:title).join(", ")}")
    end
  end
end
