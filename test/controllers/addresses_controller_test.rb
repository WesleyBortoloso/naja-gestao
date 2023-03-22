require 'test_helper'

class AddressesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @address = addresses(:one)
    @user = users(:one)
    sign_in(@user)
  end

  test "should create municipe" do
    assert_difference("Address.count") do
      post addresses_url(municipe_id: Municipe.last.id), params: { address: { street: @address.street,
                                                                              complement: @address.complement,
                                                                              city: @address.city,
                                                                              neighborhood: @address.neighborhood,
                                                                              state: @address.state,
                                                                              ibge_code: @address.ibge_code,
                                                                              zip_code: @address.zip_code } }
    end
    assert_redirected_to municipes_path
  end

  test "should not create municipe without street" do
    assert_no_difference("Address.count") do
      post addresses_url(municipe_id: Municipe.last.id), params: { address: { complement: @address.complement,
                                                                              city: @address.city,
                                                                              neighborhood: @address.neighborhood,
                                                                              state: @address.state,
                                                                              ibge_code: @address.ibge_code,
                                                                              zip_code: @address.zip_code } }
    end
    assert :street, flash[:notice][0].attribute
  end

  test "should create municipe without complement" do
    assert_difference("Address.count") do
      post addresses_url(municipe_id: Municipe.last.id), params: { address: { street: @address.street,
                                                                              city: @address.city,
                                                                              neighborhood: @address.neighborhood,
                                                                              state: @address.state,
                                                                              ibge_code: @address.ibge_code,
                                                                              zip_code: @address.zip_code } }
    end
    assert_redirected_to municipes_path
  end

  test "should not create municipe without city" do
    assert_no_difference("Address.count") do
      post addresses_url(municipe_id: Municipe.last.id), params: { address: { street: @address.street,
                                                                              complement: @address.complement,
                                                                              neighborhood: @address.neighborhood,
                                                                              state: @address.state,
                                                                              ibge_code: @address.ibge_code,
                                                                              zip_code: @address.zip_code } }
    end
  end

  test "should not create municipe without neighborhood" do
    assert_no_difference("Address.count") do
      post addresses_url(municipe_id: Municipe.last.id), params: { address: { street: @address.street,
                                                                              complement: @address.complement,
                                                                              city: @address.city,
                                                                              state: @address.state,
                                                                              ibge_code: @address.ibge_code,
                                                                              zip_code: @address.zip_code } }
    end
    assert :neighborhood, flash[:notice][0].attribute
  end

  test "should not create municipe without state" do
    assert_no_difference("Address.count") do
      post addresses_url(municipe_id: Municipe.last.id), params: { address: { street: @address.street,
                                                                              complement: @address.complement,
                                                                              city: @address.city,
                                                                              neighborhood: @address.neighborhood,
                                                                              ibge_code: @address.ibge_code,
                                                                              zip_code: @address.zip_code } }
    end
    assert :state, flash[:notice][0].attribute
  end

  test "should create municipe without ibge_code" do
    assert_difference("Address.count") do
      post addresses_url(municipe_id: Municipe.last.id), params: { address: { street: @address.street,
                                                                              complement: @address.complement,
                                                                              city: @address.city,
                                                                              neighborhood: @address.neighborhood,
                                                                              state: @address.state,
                                                                              zip_code: @address.zip_code } }
    end
    assert_redirected_to municipes_path
  end

  test "should not create municipe without zip_code" do
    assert_no_difference("Address.count") do
      post addresses_url(municipe_id: Municipe.last.id), params: { address: { street: @address.street,
                                                                              complement: @address.complement,
                                                                              city: @address.city,
                                                                              neighborhood: @address.neighborhood,
                                                                              state: @address.state,
                                                                              ibge_code: @address.ibge_code} }
    end
    assert :zip_code, flash[:notice][0].attribute
  end
end
