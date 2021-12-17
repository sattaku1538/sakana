class Public::CustomersController < ApplicationController

    def index
     # @customers = Customer.all
     # @customer = Customer.find(params[:id])
     # @books = @customers.books
     # # 変数を定義し、0を代入。いいねｎ合計を表示。
     # @favorites_count = 0
     # # countメソッドを使い、１つの投稿に結びつくイイねを予め定義しておいた@likes_countに足していく。
     #  @books.each do |post|
     #  @favorites_count += post.favorites.count
     # end
     @customers = Customer.includes(:favorites).sort {|a,b| b.favorited_books.size <=> a.favorited_books.size} 
    end
    
    def show
   	 @customer = current_customer
     @books = @customer.books
     # 変数を定義し、0を代入。いいねｎ合計を表示。
     @favorites_count = 0
     # countメソッドを使い、１つの投稿に結びつくイイねを予め定義しておいた@likes_countに足していく。
      @books.each do |post|
      @favorites_count += post.favorites.count
      end
	   end

   	def edit
   	#  @customer = Customer.find(params[:id])
   	 @customer = current_customer
   	end
 
   	def update
   	 @customer = current_customer
   	#  @customer = Customer.find(params[:id])
     if @customer.update(customer_params)
     	redirect_to public_customers_path
     	# フラッシュメッセージいれる？notice: "You have updated your account successfully."
      else
        render "edit"
      end
    end

   	def unsubscribe
   	 @customer = current_customer
    end

    def withdraw
     @customer = current_customer
     @customer.update(is_deleted: true)
     reset_session
     # flash[:] = "退会処理を実行いたしました"
     redirect_to root_path
    end
    
    private
    
    def customer_params
     params.require(:customer).permit(:email, :introduction, :name, :profile_image)
    end
end
