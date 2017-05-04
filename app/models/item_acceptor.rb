class ItemAcceptor
  attr_reader :cart_id, :params

  def initialize(params)
    @cart_id = params[:cart_id]
    @params = params
  end

  def persist!
    if cart_id
      item = Item.where(cart_id: cart_id,
                        external_id: params[:external_id]).first
      if item
        item.update_attributes!(params)
      else
        Item.create!(id: SecureRandom.uuid,
                     cart_id: params[:cart_id],
                     external_id: params[:external_id],
                     name: params[:name],
                     value: params[:value])
      end

      cart_id
    else
      cart = Cart.create!(id: SecureRandom.uuid)
      cart.items.create!(id: SecureRandom.uuid,
                         external_id: params[:external_id],
                         name: params[:name],
                         value: params[:value])

      cart.id
    end
  end
end
