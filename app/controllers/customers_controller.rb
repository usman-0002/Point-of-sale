class CustomersController < ApplicationController
  before_action :find_customer, only: %i[show edit update destroy]
  def index
    @pagy, @customers = pagy(Customer.includes(:customer_detail))
  end

  def new
    @customer = Customer.new
    @customer_detail = UserDetail.new
  end

  def create
    @customer = Customer.new
    @customer_detail = UserDetail.new(customer_detail_params)
    if @customer.save
      @customer_detail.detailable = @customer
      if @customer_detail.save
        redirect_to customers_path, notice: 'Customer added Successfully!'
      else
        flash.now[:alert] = @customer_detail.errors.full_messages
        render :new
      end
    else
      flash.now[:alert] = @customer.errors.full_messages
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @customer_detail.update(customer_detail_params)
      redirect_to customer_path, notice: 'Customer updated Successfully!'
    else
      flash.now[:alert] = @customer_detail.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @customer.destroy
      flash[:notice] = 'Customer deleted Successfully!'
    else
      flash[:alert] = @customer.customer_detail.errors.full_messages
    end
    redirect_to customers_path
  end

  def search
    search_params = params.permit(:search)['search'].strip
    @pagy, @customers = pagy(Customer.name_filter(search_params))
    respond_to do |format|
      format.js
    end
  end

  private

  def customer_detail_params
    params.require(:customer)[:user_detail].permit(:first_name, :last_name,
                                                       :email, :mobile_number,
                                                       :address, :city, :avatar)
  end

  def find_customer
    @customer = Customer.find(params[:id])
    @customer_detail = @customer.customer_detail
  end
end
