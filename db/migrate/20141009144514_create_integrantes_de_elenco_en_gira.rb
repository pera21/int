class CreateIntegrantesDeElencoEnGira < ActiveRecord::Migration
  def change
    create_table :integrantes_de_elenco_en_gira do |t|
      t.string :type, :null => false
      t.string :nombre, :null => false
      t.string :apellido, :null => false
      t.string :cuil_cuit, :null => false
      t.datetime :fecha_de_nacimiento, :null => false
      t.string :calle, :null => false
      t.string :altura_calle, :null => false
      t.string :piso
      t.string :depto
      t.references :provincia, index: true, :null => false
      t.references :localidad, index: true, :null => false
      t.string :codigo_postal, :null => false
      t.string :tel_particular
      t.string :tel_celular
      t.string :email, :null => false
      t.references :elenco_en_gira, index: true, :null => false

      t.timestamps
    end
    add_index :integrantes_de_elenco_en_gira, :type
  end
end