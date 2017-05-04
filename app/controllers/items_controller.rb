class ItemsController < ApplicationController
  def create
    cart_id = cookies[:cart_id] || item_params[:cart_id]
    modified_params = item_params.merge({cart_id: cart_id})

    @cart_id = ItemAcceptor.new(modified_params).persist!


    cookies[:cart_id] = @cart_id
    render status: :created, formats: :json
  end

  def item_params
    params.permit(:cart_id, :external_id, :name, :value)
  end
end
