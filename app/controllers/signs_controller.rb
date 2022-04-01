class SignsController < ApplicationController
  before_action :set_sign, only: %i[ show edit update destroy ]

  # GET /signs or /signs.json
  def index
    @signs = Sign.all
  end

  # GET /signs/1 or /signs/1.json
  def show
  end

  # GET /signs/new
  def new

    @sign = Sign.new
  end

  # GET /signs/1/edit
  def edit
  end

  # POST /signs or /signs.json
  def create
    @sign = Sign.new(sign_params)

    respond_to do |format|
      if @sign.save
        format.html { redirect_to sign_url(@sign), notice: " #{@sign.username} welcome to some app Sign was successfully created." }
        format.json { render :show, status: :created, location: @sign }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /signs/1 or /signs/1.json
  def update
    respond_to do |format|
      if @sign.update(sign_params)
        format.html { redirect_to sign_url(@sign), notice: "Sign was successfully updated." }
        format.json { render :show, status: :ok, location: @sign }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /signs/1 or /signs/1.json
  def destroy
    @sign.destroy

    respond_to do |format|
      format.html { redirect_to signs_url, notice: "Sign was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sign
      @sign = Sign.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sign_params
      params.require(:sign).permit(:username, :mail, :password, :password_confirmation)
    end
end
