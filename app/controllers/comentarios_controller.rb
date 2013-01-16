class ComentariosController < ApplicationController
  # GET /comentarios
  # GET /comentarios.json
  def index
    @comentarios = Comentario.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comentarios }
    end
  end

  # GET /comentarios/1
  # GET /comentarios/1.json
  def show
    @comentario = Comentario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comentario }
    end
  end

  # GET /comentarios/new
  # GET /comentarios/new.json
  def new
    @comentario = Comentario.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comentario }
    end
  end

  # GET /comentarios/1/edit
  def edit
    @comentario = Comentario.find(params[:id])
  end

  # POST /comentarios
  # POST /comentarios.json
  def create
    @comentario = Comentario.new(params[:comentario])
    @comentario.usuario_id = current_user.id
    @comentario.post_id = session[:post_id]
    session[:post_id] = nil

    if @comentario.save
      flash[:notice] = "Comentario creado correctamente."
      redirect_to @comentario.post
    else
      flash[:alert] = "Se produjo un error al crear el comentario."
      redirect_to @comentario.post
    end
    # respond_to do |format|
    #   if @comentario.save
    #     format.html { redirect_to @comentario, notice: 'Comentario was successfully created.' }
    #     format.json { render json: @comentario, status: :created, location: @comentario }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @comentario.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PUT /comentarios/1
  # PUT /comentarios/1.json
  def update
    @comentario = Comentario.find(params[:id])

    if @comentario.update_attributes(params[:comentario])
      flash[:notice] = "El comentario se ha editado correctamente."
      redirect_to @comentario.post
    else
      flash[:alert] = "Se produjo un error al editar el comentario."
      redirect_to @comentario.post
    end

    # respond_to do |format|
    #   if @comentario.update_attributes(params[:comentario])
    #     format.html { redirect_to @comentario, notice: 'El comentario se ha editado correctamente.' }
    #     format.json { head :no_content }
    #   else
    #     format.html { render action: "edit" }
    #     format.json { render json: @comentario.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /comentarios/1
  # DELETE /comentarios/1.json
  def destroy
    @comentario = Comentario.find(params[:id])
    @post = @comentario.post
    @comentario.destroy

    respond_to do |format|
      format.html { redirect_to @post }
      format.json { head :no_content }
    end
  end
end
