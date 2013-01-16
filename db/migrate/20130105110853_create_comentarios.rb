class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.text :texto
      t.integer :usuario_id
      t.integer :post_id

      t.timestamps
    end
  end
end
