class TransactionsController < ApplicationController
  before_action :load_party
  before_action :load_products
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource


  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = @resource = @party.transactions

    @transactions = @transactions.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to new_party_transaction_url, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to new_party_transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to bank_statement_user_url(@transaction.customer_id), notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def load_party
      @party = Party.find(params[:party_id])
      @product_ids = InventoryItem.includes(:product).where(party_id: params[:party_id]).pluck(:product_id)
    end

    def load_products
      product_ids = InventoryItem.includes(:product).where(party_id: params[:party_id]).pluck(:product_id)
      @products = Product.find(product_ids)
    end

  # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:employee_id, :customer_id, :party_id, :product_id, :quantity, :value)
    end
end
