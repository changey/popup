class CreatePops < ActiveRecord::Migration
  def change
    create_table :pops do |t|
      t.decimal :lat
      t.decimal :long
      t.string :comment

      t.timestamps
    end
  end
end
