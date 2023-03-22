require "test_helper"
require 'minitest/autorun'

class MunicipeTest < ActiveSupport::TestCase
  test "should not save municipe without required attributes" do
    municipe = Municipe.new
    assert_not municipe.valid?
  end

  test "should save municipe with required attributes" do
    municipe = Municipe.new(
      name: "Wesley teste",
      cpf: "123.456.789-00",
      cns: "123456789012345",
      email: "wesleyteste@example.com",
      birthdate: Date.new(1990, 1, 1),
      phone: "1234-5678",
      status: "ativo"
    )
    assert municipe.valid?
  end

  test "should save municipe with invalid cpf" do
    municipe = Municipe.new(
      name: "Wesley teste",
      cpf: "123.456.789-002",
      cns: "123456789012345",
      email: "wesleyteste@example.com",
      birthdate: Date.new(1990, 1, 1),
      phone: "1234-5678",
      status: "ativo"
    )
    assert_not municipe.valid?
  end

  test "should save municipe with invalid cns" do
    municipe = Municipe.new(
      name: "Wesley teste",
      cpf: "123.456.789-00",
      cns: "1234567890123451",
      email: "wesleyteste@example.com",
      birthdate: Date.new(1990, 1, 1),
      phone: "1234-5678",
      status: "ativo"
    )
    assert_not municipe.valid?
  end

  test "should save municipe with invalid email" do
    municipe = Municipe.new(
      name: "Wesley teste",
      cpf: "123.456.789-00",
      cns: "123456789012345",
      email: "wesleytesteexample.com",
      birthdate: Date.new(1990, 1, 1),
      phone: "1234-5678",
      status: "ativo"
    )
    assert_not municipe.valid?
  end

  test "should not save municipe without name attribute" do
    municipe = Municipe.new(
      cpf: "123.456.789-00",
      cns: "123456789012345",
      email: "wesleyteste@example.com",
      birthdate: Date.new(1990, 1, 1),
      phone: "1234-5678",
      status: "ativo"
    )
    assert_not municipe.valid?
  end

  test "should not save municipe without cpf attribute" do
    municipe = Municipe.new(
      name: "Wesley teste",
      cns: "123456789012345",
      email: "wesleyteste@example.com",
      birthdate: Date.new(1990, 1, 1),
      phone: "1234-5678",
      status: "ativo"
    )
    assert_not municipe.valid?
  end

  test "should not save municipe without cns attribute" do
    municipe = Municipe.new(
      name: "Wesley teste",
      cpf: "123.456.789-00",
      email: "wesleyteste@example.com",
      birthdate: Date.new(1990, 1, 1),
      phone: "1234-5678",
      status: "ativo"
    )
    assert_not municipe.valid?
  end

  test "should not save municipe without email attribute" do
    municipe = Municipe.new(
      name: "Wesley teste",
      cpf: "123.456.789-00",
      cns: "123456789012345",
      birthdate: Date.new(1990, 1, 1),
      phone: "1234-5678",
      status: "ativo"
    )
    assert_not municipe.valid?
  end

  test "should not save municipe without birthdate attribute" do
    municipe = Municipe.new(
      name: "Wesley teste",
      cpf: "123.456.789-00",
      cns: "123456789012345",
      email: "wesleyteste@example.com",
      phone: "1234-5678",
      status: "ativo"
    )
    assert_not municipe.valid?
  end

  test "should not save municipe without phone attribute" do
    municipe = Municipe.new(
      name: "Wesley teste",
      cpf: "123.456.789-00",
      cns: "123456789012345",
      email: "wesleyteste@example.com",
      birthdate: Date.new(1990, 1, 1),
      status: "ativo"
    )
    assert_not municipe.valid?
  end

  test "should not save municipe without status attribute" do
    municipe = Municipe.new(
      name: "Wesley teste",
      cpf: "123.456.789-00",
      cns: "123456789012345",
      email: "wesleyteste@example.com",
      birthdate: Date.new(1990, 1, 1),
      phone: "1234-5678"
    )
    assert_not municipe.valid?
  end

  test "should not save municipe with unreal birthdate " do
    municipe = Municipe.new(
      name: "Wesley teste",
      cpf: "123.456.789-00",
      cns: "123456789012345",
      email: "wesleyteste@example.com",
      birthdate: Date.tomorrow,
      phone: "1234-5678",
      status: "ativo"
    )
    assert_not municipe.valid?
    assert 'A data de nascimento não condiz com a realidade.', municipe.errors.errors[0].type
  end
end
