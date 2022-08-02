class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def index
    @accounts = Account.all
  end

  def show
    @nominees = @account.nominees
  end


  def new
    @account = Account.new
    @nominees = @account.nominees.build
  end


  def edit
  end

  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to account_url(@account), notice: "Account was successfully created." }
       
      else
        format.html { render :new, status: :unprocessable_entity }

      end
    end
  end


  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to account_url(@account), notice: "Account was successfully updated." }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url, notice: "Account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    
    def set_account
      @account = Account.find(params[:id])
    end


    def account_params
      params.require(:account).permit(:balance, :user_id, :name, nominees_attributes: [:id, :nominee_name, :user_id, :percentage, :_destroy].push(:_destory))
    end
end
