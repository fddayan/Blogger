class PruebalocasController < ApplicationController
  skip_authorization_check
  # GET /pruebalocas
  # GET /pruebalocas.json
  def index
    @pruebalocas = Pruebaloca.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pruebalocas }
    end
  end

  # GET /pruebalocas/1
  # GET /pruebalocas/1.json
  def show
    @pruebaloca = Pruebaloca.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pruebaloca }
    end
  end

  # GET /pruebalocas/new
  # GET /pruebalocas/new.json
  def new
    @pruebaloca = Pruebaloca.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pruebaloca }
    end
  end

  # GET /pruebalocas/1/edit
  def edit
    @pruebaloca = Pruebaloca.find(params[:id])
  end

  # POST /pruebalocas
  # POST /pruebalocas.json
  def create
    @pruebaloca = Pruebaloca.new(params[:pruebaloca])

    respond_to do |format|
      if @pruebaloca.save
        format.html { redirect_to @pruebaloca, notice: 'Pruebaloca was successfully created.' }
        format.json { render json: @pruebaloca, status: :created, location: @pruebaloca }
      else
        format.html { render action: "new" }
        format.json { render json: @pruebaloca.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pruebalocas/1
  # PUT /pruebalocas/1.json
  def update
    @pruebaloca = Pruebaloca.find(params[:id])

    respond_to do |format|
      if @pruebaloca.update_attributes(params[:pruebaloca])
        format.html { redirect_to @pruebaloca, notice: 'Pruebaloca was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pruebaloca.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pruebalocas/1
  # DELETE /pruebalocas/1.json
  def destroy
    @pruebaloca = Pruebaloca.find(params[:id])
    @pruebaloca.destroy

    respond_to do |format|
      format.html { redirect_to pruebalocas_url }
      format.json { head :no_content }
    end
  end
end
