require 'test_helper'

class MunicipesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @municipe = municipes(:one)
    @user = users(:one)
    sign_in(@user)
  end

  test "should create municipe" do
    assert_difference("Municipe.count") do
      post municipes_url, params: { municipe: { birthdate: @municipe.birthdate,
                                                cns: @municipe.cns, cpf: @municipe.cpf,
                                                email: 'testegmail@gmail.com', name: @municipe.name,
                                                phone: @municipe.phone, status: @municipe.status } }
    end

    assert_redirected_to new_addresses_path(municipe_id: Municipe.last.id)
  end

  test "should not create municipe without birthdate" do
    assert_no_difference("Municipe.count") do
      post municipes_url, params: { municipe: { cns: @municipe.cns, cpf: @municipe.cpf,
                                                email: 'testegmail@gmail.com', name: @municipe.name,
                                                phone: @municipe.phone, status: @municipe.status } }
    end

    assert_select 'div.field_with_errors', /Data de aniversário/
  end

  test "should not create municipe without cns" do
    assert_no_difference("Municipe.count") do
      post municipes_url, params: { municipe: { birthdate: @municipe.birthdate, cpf: @municipe.cpf,
                                                email: 'testegmail@gmail.com', name: @municipe.name,
                                                phone: @municipe.phone, status: @municipe.status } }
    end

    assert_select 'div.field_with_errors', /Código nacional de saúde/
  end

  test "should not create municipe without cpf" do
    assert_no_difference("Municipe.count") do
      post municipes_url, params: { municipe: { birthdate: @municipe.birthdate, cns: @municipe.cns,
                                                email: 'testegmail@gmail.com', name: @municipe.name,
                                                phone: @municipe.phone, status: @municipe.status } }
    end

    assert_select 'div.field_with_errors', /CPF/
  end

  test "should not create municipe without email" do
    assert_no_difference("Municipe.count") do
      post municipes_url, params: { municipe: { birthdate: @municipe.birthdate, cns: @municipe.cns, cpf: @municipe.cpf,
                                                name: @municipe.name, phone: @municipe.phone, status: @municipe.status } }
    end

    assert_select 'div.field_with_errors', /Email/
  end

  test "should not create municipe without name" do
    assert_no_difference("Municipe.count") do
      post municipes_url, params: { municipe: { birthdate: @municipe.birthdate, cns: @municipe.cns, cpf: @municipe.cpf,
                                                email: 'testegmail@gmail.com',
                                                phone: @municipe.phone, status: @municipe.status } }
    end

    assert_select 'div.field_with_errors', /Nome/
  end

  test "should not create municipe without phone" do
    assert_no_difference("Municipe.count") do
      post municipes_url, params: { municipe: { birthdate: @municipe.birthdate, cns: @municipe.cns, cpf: @municipe.cpf,
                                                email: 'testegmail@gmail.com', name: @municipe.name,
                                                status: @municipe.status } }
    end

    assert_select 'div.field_with_errors', /Telefone/
  end

  test "should not create municipe without status" do
    assert_no_difference("Municipe.count") do
      post municipes_url, params: { municipe: { birthdate: @municipe.birthdate, cns: @municipe.cns, cpf: @municipe.cpf,
                                                email: 'testegmail@gmail.com', name: @municipe.name, phone: @municipe.phone} }
    end

    assert_select 'div.field_with_errors', /Status/
  end

  test "should update municipe" do
    assert_no_difference("Municipe.count") do
      patch municipe_url(@municipe.id), params: { municipe: { birthdate: @municipe.birthdate,
                                                  cns: @municipe.cns, cpf: @municipe.cpf,
                                                  email: 'testegmail@gmail.com', name: 'Nome atualizado',
                                                  phone: @municipe.phone, status: @municipe.status } }
    end

    assert 'Nome atualizado', Municipe.last.name
    assert_redirected_to municipe_url
  end
end
