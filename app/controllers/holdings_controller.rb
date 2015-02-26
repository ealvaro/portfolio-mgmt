class HoldingsController < ApplicationController
  # GET /holdings
  # GET /holdings.json
  def index
    @holdings = Holding.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @holdings }
    end
  end

  # GET /holdings/1
  # GET /holdings/1.json
  def show
    @holding = Holding.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @holding }
    end
  end

  # GET /holdings/new
  # GET /holdings/new.json
  def new
    @holding = Holding.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @holding }
    end
  end

  # GET /holdings/1/edit
  def edit
    @holding = Holding.find(params[:id])
  end

  # POST /holdings
  # POST /holdings.json
  def create
    @holding = Holding.new(params[:holding])

    respond_to do |format|
      if @holding.save
        format.html { redirect_to @holding, notice: 'Holding was successfully created.' }
        format.json { render json: @holding, status: :created, location: @holding }
      else
        format.html { render action: "new" }
        format.json { render json: @holding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /holdings/1
  # PUT /holdings/1.json
  def update
    @holding = Holding.find(params[:id])

    respond_to do |format|
      if @holding.update_attributes(params[:holding])
        format.html { redirect_to @holding, notice: 'Holding was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @holding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /holdings/1
  # DELETE /holdings/1.json
  def destroy
    @holding = Holding.find(params[:id])
    @holding.destroy

    respond_to do |format|
      format.html { redirect_to holdings_url }
      format.json { head :ok }
    end
  end
end
