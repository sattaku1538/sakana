class Admin::CustomersController < ApplicationController
    before_action :authenticate_admin!,except: [:new_admin_session_path]

    def index
     @customers = Customer.all
    end

    def show
   	 @customer = Customer.find(params[:id])
	   end

    def withdraw
     @customer = Customer.find(params[:id])
     @customer.destroy()
     reset_session
     flash[:admin] = "不正なユーザーを退会させました。"
     redirect_to admin_root_path
    end

    private

    def customer_params
     params.require(:customer).permit(:is_deleted, :email, :introduction, :name, :profile_image)
    end
end
