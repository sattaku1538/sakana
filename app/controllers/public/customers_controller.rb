class Public::CustomersController < ApplicationController
    before_action :authenticate_customer!,except: [:top, :index]

    def index
<<<<<<< HEAD
     @customer = current_customer
     @customers = Customer.includes(:books).sort {|a,b| b.favorited_books.size <=> a.favorited_books.size}
     @customers = Kaminari.paginate_array(@customers).page(params[:page]).per(10)
=======
     # @customers = Customer.all
     # @customer = Customer.find(params[:id])
     # @books = @customers.books
     # # 変数を定義し、0を代入。いいねｎ合計を表示。
     # @favorites_count = 0
     # # countメソッドを使い、１つの投稿に結びつくイイねを予め定義しておいた@likes_countに足していく。
     #  @books.each do |post|
     #  @favorites_count += post.favorites.count
     # end
     # @customers = Customer.includes(:favorites).sort {|a,b| b.favorited_books.size <=> a.favorited_books.size} 
     @customer = current_customer.id
     @customers = Customer.includes(:books).sort {|a,b| b.favorited_books.size <=> a.favorited_books.size}
>>>>>>> 834a4acbd8fefcecc77b845b6f25012e9f710743
    end

    def show
<<<<<<< HEAD
   	 @customer = current_customer
   	 @customeruser = Customer.find(params[:id])
     @books = @customeruser.books
     @books = Kaminari.paginate_array(@books).page(params[:page]).per(10)
=======
   	 @customer = Customer.find(params[:id])
     @books = @customer.books
>>>>>>> 834a4acbd8fefcecc77b845b6f25012e9f710743
     # 変数を定義し、0を代入。いいねｎ合計を表示。
     @favorites_count = 0
     # countメソッドを使い、１つの投稿に結びつくイイねを予め定義しておいた@likes_countに足していく。
     @books.each do |post|
     @favorites_count += post.favorites.count
     end
	   end

   	def edit
   	 @customeruser = Customer.find(params[:id])
   	 @customer = current_customer
   	end

   	def update
   	 @customer = current_customer
   	 @customeruser = Customer.find(params[:id])
     if @customer.update(customer_params)
     flash[:edit] = "＜更新しました。＞"
     redirect_to public_customers_path
     else
     flash[:notice] = "＜更新できません。＞"
     render "edit"
     end
    end

   	def unsubscribe
   	 @customeruser = Customer.find(params[:id])
   	 @customer = current_customer
    end

    def withdraw
     @customer = current_customer
     @customer.destroy()
     reset_session
     flash[:destroy] = "＜退会処理を実行いたしました。＞"
     redirect_to root_path
    end

    private

    def customer_params
     params.require(:customer).permit(:email, :introduction, :name, :profile_image)
    end
end
