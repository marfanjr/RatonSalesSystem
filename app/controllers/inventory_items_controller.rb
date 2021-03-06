class InventoryItemsController < ApplicationController
  before_action :load_party
  before_action :set_inventory_item, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /inventory_items
  # GET /inventory_items.json
  def index
    # @inventory_items = InventoryItem.all
    @inventory_items = @resource = @party.inventory_items

    @inventory_items = @inventory_items.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /inventory_items/1
  # GET /inventory_items/1.json
  def show
  end

  # GET /inventory_items/new
  def new
    @inventory_item = InventoryItem.new
  end

  # GET /inventory_items/1/edit
  def edit
  end

  # POST /inventory_items
  # POST /inventory_items.json
  def create
    @inventory_item = InventoryItem.new(inventory_item_params)

    respond_to do |format|
      if @inventory_item.save
        format.html { redirect_to party_inventory_items_url, notice: 'Inventory item was successfully created.' }
        format.json { render :show, status: :created, location: @inventory_item }
      else
        format.html { render :new }
        format.json { render json: @inventory_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventory_items/1
  # PATCH/PUT /inventory_items/1.json
  def update
    respond_to do |format|
      if @inventory_item.update(inventory_item_params)
        format.html { redirect_to party_inventory_items_url, notice: 'Inventory item was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory_item }
      else
        format.html { render :edit }
        format.json { render json: @inventory_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory_items/1
  # DELETE /inventory_items/1.json
  def destroy
    @inventory_item.destroy
    respond_to do |format|
      format.html { redirect_to party_inventory_items_url, notice: 'Inventory item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def load_party
      @party = Party.find(params[:party_id])
    end

    def set_inventory_item
      @inventory_item = @resource = @party.inventory_items.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_item_params
      params.require(:inventory_item).permit(:product_id, :party_id, :amount_purchased, :unit_cost, :total_cost, :profit_margin, :amount_sold)
    end
end
