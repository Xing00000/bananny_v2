class CreateOrtherQualifications < ActiveRecord::Migration[5.0]
  def change
    create_table :orther_qualifications do |t|
      t.string :name

      t.timestamps
    end
  end
end
