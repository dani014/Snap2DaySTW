class AddUsuarioIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :usuario_id, :integer
  end
end
