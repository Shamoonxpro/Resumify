class CreateEducations < ActiveRecord::Migration[6.0]
  def change
    create_table :educations do |t|
      t.string :institute_name
      t.string :degree
      t.date :strat_date
      t.date :end_date

      t.timestamps
    end
  end
end
