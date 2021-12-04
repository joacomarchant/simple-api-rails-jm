require "test_helper"

class DojosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dojo = dojos(:one)
  end

  test "should get index" do
    get dojos_url, as: :json
    assert_response :success
  end

  test "should create dojo" do
    assert_difference('Dojo.count') do
      post dojos_url, params: { dojo: { descripcion: @dojo.descripcion, nombre: @dojo.nombre } }, as: :json
    end

    assert_response 201
  end

  test "should show dojo" do
    get dojo_url(@dojo), as: :json
    assert_response :success
  end

  test "should update dojo" do
    patch dojo_url(@dojo), params: { dojo: { descripcion: @dojo.descripcion, nombre: @dojo.nombre } }, as: :json
    assert_response 200
  end

  test "should destroy dojo" do
    assert_difference('Dojo.count', -1) do
      delete dojo_url(@dojo), as: :json
    end

    assert_response 204
  end
end
