class UsuarioSessionsController < ApplicationController
	def new
		@usuario = Usuario.new
	end
	def create
		if @usuario = login(params[:username],params[:password])
			session[:usuario_new] = true
			flash[:notice] = "Ha iniciado sesion correctamente"
			redirect_to request.headers["HTTP_REFERER"]
		else
			flash[:alert] = "Algo salio mal con el login"
			redirect_to request.headers["HTTP_REFERER"]
		end
	end
	def destroy
		logout
		session[:usuario_new] = false
		flash[:notice] = "Ha terminado la sesion"
		redirect_to :posts
	end
end
