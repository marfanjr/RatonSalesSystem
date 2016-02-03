class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :bank_statement]
  load_and_authorize_resource

  def index
    @users = User.joins(:profile).order('profiles.name')
    if params[:role].presence 
      if params[:role] == 'employee'
    	  @users = @users.where(role: 0)
      elsif params[:role] == 'customer'
        @users = @users.where(role: 1)
      end
    end
    
    # TODO: verificar melhor maneira para fazer filtros sem poluir os controllers
    if params[:q].presence
      @users = @users.search(params[:q])
    end

    @users = @users.paginate(:page => params[:page], :per_page => 10)
  end


  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(users_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to parties_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def bank_statement
    @shopping = Transaction.where(customer_id: params[:id])

    @shopping = @shopping.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html { render :bank_statement }
      format.json { render json: @shopping}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:password, :password_confirmation, :current_password, :role, {profile_attributes: [:id, :name, :cpf, :rg, :telephone, :cell_phone, :email, :credits]})
    end

end