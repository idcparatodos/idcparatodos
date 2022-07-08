class RedesController < ApplicationController
  before_action :set_rede, only: %i[ show edit update destroy ]

  # GET /redes or /redes.json
  def index
    @redes = Rede.all
  end

  # GET /redes/1 or /redes/1.json
  def show
    @registros = @rede.registros.limit 100
  end

  # GET /redes/new
  def new
    @rede = Rede.new
  end

  # GET /redes/1/edit
  def edit
  end

  # POST /redes or /redes.json
  def create
    @rede = Rede.new(rede_params)

    respond_to do |format|
      if @rede.save
        format.html { redirect_to rede_url(@rede), notice: "Rede criada." }
        format.json { render :show, status: :created, location: @rede }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rede.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /redes/1 or /redes/1.json
  def update
    respond_to do |format|
      if @rede.update(rede_params)
        format.html { redirect_to rede_url(@rede), notice: "Rede salva." }
        format.json { render :show, status: :ok, location: @rede }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rede.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /redes/1 or /redes/1.json
  def destroy
    @rede.destroy

    respond_to do |format|
      format.html { redirect_to redes_url, notice: "Rede excluida." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rede
      @rede = Rede.find_by_token(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rede_params
      params.require(:rede).permit(:nome, :token)
    end
end
