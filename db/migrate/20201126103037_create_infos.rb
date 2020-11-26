class CreateInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :infos do |t|
      t.string     :postal,  null: false
      t.integer    :area_id, null: false
      t.string     :city,    null: false 
      t.string     :add,     null: false 
      t.string     :bldg
      t.string     :tel,     null: false 
      t.references :order,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
