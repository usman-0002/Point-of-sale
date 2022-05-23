class SuppliersController < ApplicationController
  before_action :find_supplier, only: %i[show edit update destroy]
  def index
    @pagy, @suppliers = pagy(Supplier.includes(:supplier_detail))
  end

  def new
    @supplier = Supplier.new
    @supplier_detail = UserDetail.new
  end

  def create
    @supplier = Supplier.new(supplier_params)
    @supplier_detail = UserDetail.new(supplier_detail_params)
    if @supplier.save
      @supplier_detail.detailable = @supplier
      if @supplier_detail.save
        redirect_to suppliers_path, notice: 'Supplier added Successfully!'
      else
        flash.now[:alert] = @supplier_detail.errors.full_messages
        render :new
      end
    else
      flash.now[:alert] = @supplier.errors.full_messages
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @supplier.update(supplier_params)
      if @supplier_detail.update(supplier_detail_params)
        redirect_to supplier_path, notice: 'Supplier updated Successfully!'
      else
        flash.now[:alert] = @supplier_detail.errors.full_messages
        render :edit
      end
    else
      flash.now[:alert] = @supplier.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @supplier.destroy
      flash[:notice] = 'Supplier deleted Successfully!'
    else
      flash[:alert] = @supplier.supplier_detail.errors.full_messages
    end
    redirect_to suppliers_path
  end

  def search
    search_params = params.permit(:search)['search'].strip
    @pagy, @suppliers = pagy(Supplier.name_filter(search_params))
    respond_to do |format|
      format.js
    end
  end

  private

  def supplier_params
    params.require(:supplier).permit(:company_name, :office_number)
  end

  def supplier_detail_params
    params.require(:supplier)[:user_detail].permit(:first_name, :last_name,
                                                       :email, :mobile_number,
                                                       :address, :city, :avatar)
  end

  def find_supplier
    @supplier = Supplier.find(params[:id])
    @supplier_detail = @supplier.supplier_detail
  end
end
