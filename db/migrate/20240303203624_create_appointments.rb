class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.string :title
      t.string :description
      t.datetime :start_date
      t.datetime :end_date
      t.string :summary

      t.timestamps
    end
  end
end
