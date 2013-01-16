class Usuario < ActiveRecord::Base
	attr_accessible :admin, :username, :sexo
	
	authenticates_with_sorcery!
	
	has_many :posts
	has_many :comentarios

	has_many :relationships, :foreign_key => "follower_id",
                           :dependent => :destroy
        has_many :following, :through => :relationships, :source => :followed
	has_many :reverse_relationships, :foreign_key => "followed_id",
                                   :class_name => "Relationship",
                                   :dependent => :destroy
	has_many :followers, :through => :reverse_relationships, :source => :follower
	
	validates_confirmation_of :password, message: "Ambos campos deben coincidir", if: :password
	validates_length_of :password, :minimum => 5, :too_short => "El password debe tener al menos 5 caracteres"
	validates_uniqueness_of :username, message: "El nombre de usuario ya existe."
	validates_uniqueness_of :email, message: "El email introducido ya se encuentra en la base de datos."
	validates_presence_of :username, message: "Debe introducir un nombre de usuario."
	validates_presence_of :email, message: "Debe introducir un email"
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create, message: "Introduzca un email con el formato correcto"
	validates_presence_of :password, message: "Debe introducir un password"
	
  def following?(followed)
    relationships.find_by_followed_id(followed)
  end

  def follow!(followed)
    relationships.create!(:followed_id => followed.id)
  end

  def unfollow!(followed)
    relationships.find_by_followed_id(followed).destroy
  end

end


