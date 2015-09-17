require 'test_helper'

class DatosgeneralesControllerTest < ActionController::TestCase
  setup do
    @datosgenerale = datosgenerales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:datosgenerales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create datosgenerale" do
    assert_difference('Datosgenerale.count') do
      post :create, datosgenerale: { actualizacion: @datosgenerale.actualizacion, alta: @datosgenerale.alta, clavesalida: @datosgenerale.clavesalida, contacto1_id: @datosgenerale.contacto1_id, contacto2_id: @datosgenerale.contacto2_id, contacto3_id: @datosgenerale.contacto3_id, contacto4_id: @datosgenerale.contacto4_id, contacto5_id: @datosgenerale.contacto5_id, did: @datosgenerale.did, fax: @datosgenerale.fax, giro: @datosgenerale.giro, locacion: @datosgenerale.locacion, paginaweb: @datosgenerale.paginaweb, procedimiento: @datosgenerale.procedimiento, telefono1: @datosgenerale.telefono1, telefono2: @datosgenerale.telefono2, telefono3: @datosgenerale.telefono3, telefono4: @datosgenerale.telefono4, telefono5: @datosgenerale.telefono5, telenrutados: @datosgenerale.telenrutados }
    end

    assert_redirected_to datosgenerale_path(assigns(:datosgenerale))
  end

  test "should show datosgenerale" do
    get :show, id: @datosgenerale
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @datosgenerale
    assert_response :success
  end

  test "should update datosgenerale" do
    patch :update, id: @datosgenerale, datosgenerale: { actualizacion: @datosgenerale.actualizacion, alta: @datosgenerale.alta, clavesalida: @datosgenerale.clavesalida, contacto1_id: @datosgenerale.contacto1_id, contacto2_id: @datosgenerale.contacto2_id, contacto3_id: @datosgenerale.contacto3_id, contacto4_id: @datosgenerale.contacto4_id, contacto5_id: @datosgenerale.contacto5_id, did: @datosgenerale.did, fax: @datosgenerale.fax, giro: @datosgenerale.giro, locacion: @datosgenerale.locacion, paginaweb: @datosgenerale.paginaweb, procedimiento: @datosgenerale.procedimiento, telefono1: @datosgenerale.telefono1, telefono2: @datosgenerale.telefono2, telefono3: @datosgenerale.telefono3, telefono4: @datosgenerale.telefono4, telefono5: @datosgenerale.telefono5, telenrutados: @datosgenerale.telenrutados }
    assert_redirected_to datosgenerale_path(assigns(:datosgenerale))
  end

  test "should destroy datosgenerale" do
    assert_difference('Datosgenerale.count', -1) do
      delete :destroy, id: @datosgenerale
    end

    assert_redirected_to datosgenerales_path
  end
end
