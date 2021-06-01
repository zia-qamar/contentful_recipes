require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest

  test '1 - should verify recipes index page' do
    get recipes_url
    assert_response :success
    assert_not_nil assigns(:recipes)
  end

  test '2 - should verify recipe show page' do
    get recipe_url(id: '4dT8tcb6ukGSIg2YyuGEOm')
    assert_response :success
    assert_not_nil assigns(:recipe)
  end

  test '3 - should verify no recipe with wrong id' do
    get recipe_url(id: 'TestID')
    assert_response :success
    assert_nil assigns(:recipe)
  end

  test '4 - should verify no recipes in case of wrong api keys' do
    ENV['SPACE_ID'] = 'TESTID'
    ENV['ACCESS_TOKEN'] = 'TESTID'
    get recipes_url
    assert_response :success
    assert_nil assigns(:recipes)
  end
end
