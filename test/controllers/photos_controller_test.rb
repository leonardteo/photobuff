require 'test_helper'

class PhotosControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photos)
  end

  test "should show photo submission page when logged in" do
    session[:user_id] = users(:one).id
    get :new
    assert_response 200
  end

  test "should redirect user when not logged in" do
    get :new
    assert_response 302
    assert_redirected_to login_path
  end

  test "should be able to submit a new photo" do
    session[:user_id] = users(:one).id
    assert_difference('Photo.count') do
      post :create, photo: {
        user_id: users(:one).id,
        title: "Test Post",
        description: "Bacon ipsum dolor sit amet beef shoulder frankfurter brisket short loin. Capicola shankle pork belly, turducken chuck doner leberkas short loin. Boudin strip steak pork loin shankle flank spare ribs shoulder. Ball tip leberkas beef shank jerky beef ribs tongue capicola short loin pork belly filet mignon ribeye pork doner.",
        photo: fixture_file_upload("photos/photo1.jpg")
      }
    end
    
    assert_redirected_to photo_path(assigns(:photo))
  end

  test "should be able to view a photo" do
    photo = create_photo_for_user(users(:one))
    get :show, id: photo.id
    assert_response 200
    assert_not_nil assigns(:photo)
  end

  # test "should get edit" do
  #   get :edit, id: @photo
  #   assert_response :success
  # end

  # test "should update photo" do
  #   patch :update, id: @photo, photo: { description: @photo.description, image: @photo.image, thumbnail: @photo.thumbnail, title: @photo.title }
  #   assert_redirected_to photo_path(assigns(:photo))
  # end

  # test "should destroy photo" do
  #   assert_difference('Photo.count', -1) do
  #     delete :destroy, id: @photo
  #   end

  #   assert_redirected_to photos_path
  # end
end
