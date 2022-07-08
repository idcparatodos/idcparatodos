class RegistrosController < ApplicationController
  before_action :set_rede, only: %i[ show edit update destroy update_simplificado ]

  # GET /redes or /redes.json
  def index
    @registros = @rede.registros.limit 100
  end

  # GET /redes/1 or /redes/1.json
  def show
    @registro = @rede.registros.find_by_nome(params[:id])
    if @registro
      render formats: :text
    else
      render plain: "Registro não encontrado"
    end
  end

  # GET /redes/:token/registros/:nome/:valor
  def update_simplificado
    @registro = @rede.registros.find_by_nome(params[:id])
    if @registro
      @registro.update(valor: params[:valor])
    else
      @rede.registros.create(nome: params[:id], valor: params[:valor], tipo: 'string')
    end
    render plain: "OK"
  end


  # GET /redes/new
  def new
    @registro = @rede.registros.new
  end

  # GET /redes/1/edit
  def edit
  end

  # POST /redes or /redes.json
  def create
    @registro = @rede.registros.new(registro_params)

    respond_to do |format|
      if @registro.save
        format.html { redirect_to rede_url(@rede), notice: "Registro criado." }
        format.json { render :show, status: :created, location: @registro }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @registro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /redes/1 or /redes/1.json
  def update
    respond_to do |format|
      if @registro.update(registro_params)
        format.html { redirect_to rede_url(@rede), notice: "Registro atualizado." }
        format.json { render :show, status: :ok, location: @registro }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @registro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /redes/1 or /redes/1.json
  def destroy
    @registro.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rede
      @rede = Rede.find_by_token(params[:rede_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registro_params
      params.require(:registro).permit(:nome, :valor, :tipo)
    end

end
