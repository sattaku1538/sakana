class HomesController < ApplicationController
  def top
    @customer = current_customer.id
  end
end
