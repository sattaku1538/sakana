class Admin::CustomersController < ApplicationController
    before_action :authenticate_admin!,except: [:new_admin_session_path]

    def index
     @customers = Customer.all
     @customers = Kaminari.paginate_array(@customers).page(params[:page]).per(10)
    end

    def show
   	 @customer = Customer.find(params[:id])
	   end

    def withdraw
     @customer = Customer.find(params[:id])
     @customer.destroy()
<<<<<<< HEAD
     flash[:admin] = "＜不正なユーザーを退会させました。＞"
     redirect_to admin_customers_path
=======
     reset_session
     # flash[admin] = "退会処理を実行いたしました"
     redirect_to admin_root_path
>>>>>>> 834a4acbd8fefcecc77b845b6f25012e9f710743
    end

    private

    def customer_params
     params.require(:customer).permit(:is_deleted, :email, :introduction, :name, :profile_image)
    end
end
