class Comentario < ActiveRecord::Base
  attr_accessible :post_id, :texto, :usuario_id
  belongs_to :usuario
  belongs_to :post

  validates_presence_of :texto
end
