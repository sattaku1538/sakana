class SearchsController < ApplicationController
  def search
    @customer = current_customer
    # viewのform_tagにて 選択したmodelの値を@modelに代入。
    @model = params["model"]
    # 検索ワードを@contentに代入。
    @content = params["content"]
    # @model, @content,を代入した、# search_forを@recordsに代入。
    @records = search_for(@model, @content)
    @records = Kaminari.paginate_array(@records).page(params[:page]).per(10)
  end

  private
  def search_for(model, content)
     # 選択したモデルがcustomerだったら
    if model == 'customer'
     Customer.where('name OR introduction LIKE ?', '%'+content+'%')
     # 選択したモデルがbookだったら
    elsif model == 'book'
     Book.where('title OR place OR explanation LIKE ?', '%'+content+'%')
    end
  end
end
