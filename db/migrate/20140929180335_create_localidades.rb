class CreateLocalidades < ActiveRecord::Migration
  def change
    create_table :localidades do |t|
      t.string :detalle

      t.timestamps
    end
  end
end
