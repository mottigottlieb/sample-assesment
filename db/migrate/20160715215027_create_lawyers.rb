class CreateLawyers < ActiveRecord::Migration
  def change
    create_table :lawyers do |t|
      t.string  "name"
      t.string  "practice"
      t.string  "rating"
      t.integer "years"
      t.string  "number"
    end
  end
end
