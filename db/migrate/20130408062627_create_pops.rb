class CreatePops < ActiveRecord::Migration
  def change
    create_table :pops do |t|
      t.string :name, :default=>""
      t.decimal :lat
      t.decimal :long
      t.string :comment, :default=>""
      t.string :map_id

      t.timestamps
    end
  end
end
