require 'test_helper'

class InventoryItemsControllerTest < ActionController::TestCase
  setup do
    @inventory_item = inventory_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inventory_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inventory_item" do
    assert_difference('InventoryItem.count') do
      post :create, inventory_item: { amount_purchased: @inventory_item.amount_purchased, amount_sold: @inventory_item.amount_sold, party_id: @inventory_item.party_id, product_id: @inventory_item.product_id, profit_margin: @inventory_item.profit_margin, total_cost: @inventory_item.total_cost, unit_cost: @inventory_item.unit_cost }
    end

    assert_redirected_to inventory_item_path(assigns(:inventory_item))
  end

  test "should show inventory_item" do
    get :show, id: @inventory_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inventory_item
    assert_response :success
  end

  test "should update inventory_item" do
    patch :update, id: @inventory_item, inventory_item: { amount_purchased: @inventory_item.amount_purchased, amount_sold: @inventory_item.amount_sold, party_id: @inventory_item.party_id, product_id: @inventory_item.product_id, profit_margin: @inventory_item.profit_margin, total_cost: @inventory_item.total_cost, unit_cost: @inventory_item.unit_cost }
    assert_redirected_to inventory_item_path(assigns(:inventory_item))
  end

  test "should destroy inventory_item" do
    assert_difference('InventoryItem.count', -1) do
      delete :destroy, id: @inventory_item
    end

    assert_redirected_to inventory_items_path
  end
end
