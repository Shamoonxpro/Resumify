class CreateWorkExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :work_experiences do |t|
      t.string :job_title
      t.string :company_name
      t.date :start_date
      t.date :end_date
      t.text :task

      t.timestamps
    end
  end
end
