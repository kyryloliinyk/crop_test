class CreateFields < ActiveRecord::Migration[7.1]
  def change
    create_table :fields do |t|
      t.string :name
      t.column :shape, :multi_polygon, geographic: true, srid: 4326
      t.integer :area
      t.timestamps
    end
  end
end
