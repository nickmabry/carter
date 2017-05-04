require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
   test 'a posted item returns 201' do
     post item_url, { external_id: '12345' }, format: :json
     assert_response :created
   end

   test 'a posted cart id is returned' do
     Cart.create!(id: '5678')
     post item_url, { cart_id: '5678', external_id: '12345' }, format: :json
     assert_equal '5678', JSON.parse(response.body)['cart_id']
   end

   test 'a cookie-provided cart ID is preferred' do
     Cart.create!(id: '9101112')
     cookies[:cart_id] = '9101112'
     post item_url, { cart_id: '5678', external_id: '12345' }, format: :json
     assert_equal '9101112', JSON.parse(response.body)['cart_id']
   end

   test 'a cookie is set with the assigned cart id' do
     Cart.create(id: '5678')
     post item_url, { cart_id: '5678', external_id: '12345' }, format: :json
     assert_equal '5678', cookies['cart_id']
   end

   test 'an item may be posted without an existing cart' do
     post item_url, { external_id: '12345' }, format: :json
     assert_response :created
     assert JSON.parse(response.body)['cart_id'].present?
     assert cookies['cart_id'].present?
   end
end
