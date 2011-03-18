require 'test_helper'

class MapRoutingTest < ActionController::TestCase

  test 'map new user session' do
    assert_recognizes({:controller => 'devise/sessions', :action => 'new'}, {:path => 'users/sign_in', :method => :get})
  end

  test 'map create user session' do
    assert_recognizes({:controller => 'devise/sessions', :action => 'create'}, {:path => 'users/sign_in', :method => :post})
  end

  test 'map destroy user session' do
    assert_recognizes({:controller => 'devise/sessions', :action => 'destroy'}, {:path => 'users/sign_out', :method => :get})
  end

  test 'map new user confirmation' do
    assert_recognizes({:controller => 'devise/confirmations', :action => 'new'}, 'users/confirmation/new')
  end

  test 'map create user confirmation' do
    assert_recognizes({:controller => 'devise/confirmations', :action => 'create'}, {:path => 'users/confirmation', :method => :post})
  end

  test 'map show user confirmation' do
    assert_recognizes({:controller => 'devise/confirmations', :action => 'show'}, {:path => 'users/confirmation', :method => :get})
  end

  test 'map new user password' do
    assert_recognizes({:controller => 'devise/passwords', :action => 'new'}, 'users/password/new')
  end

  test 'map create user password' do
    assert_recognizes({:controller => 'devise/passwords', :action => 'create'}, {:path => 'users/password', :method => :post})
  end

  test 'map edit user password' do
    assert_recognizes({:controller => 'devise/passwords', :action => 'edit'}, 'users/password/edit')
  end

  test 'map update user password' do
    assert_recognizes({:controller => 'devise/passwords', :action => 'update'}, {:path => 'users/password', :method => :put})
  end

  test 'map new user unlock' do
    assert_recognizes({:controller => 'devise/unlocks', :action => 'new'}, 'users/unlock/new')
  end

  test 'map create user unlock' do
    assert_recognizes({:controller => 'devise/unlocks', :action => 'create'}, {:path => 'users/unlock', :method => :post})
  end

  test 'map show user unlock' do
    assert_recognizes({:controller => 'devise/unlocks', :action => 'show'}, {:path => 'users/unlock', :method => :get})
  end

  test 'map new user registration' do
    assert_recognizes({:controller => 'devise/registrations', :action => 'new'}, 'users/sign_up')
  end

  test 'map create user registration' do
    assert_recognizes({:controller => 'devise/registrations', :action => 'create'}, {:path => 'users', :method => :post})
  end

  test 'map edit user registration' do
    assert_recognizes({:controller => 'devise/registrations', :action => 'edit'}, {:path => 'users/edit', :method => :get})
  end

  test 'map update user registration' do
    assert_recognizes({:controller => 'devise/registrations', :action => 'update'}, {:path => 'users', :method => :put})
  end

  test 'map destroy user registration' do
    assert_recognizes({:controller => 'devise/registrations', :action => 'destroy'}, {:path => 'users', :method => :delete})
  end

  test 'map admin with :as option' do
    assert_recognizes({:controller => 'devise/registrations', :action => 'new'}, {:path => 'admin_area/sign_up', :method => :get})
  end

  test 'map admin with :controllers option' do
    assert_recognizes({:controller => 'sessions', :action => 'new'}, {:path => 'admin_area/sign_in', :method => :get})
  end

  test 'does not map admin password' do
    assert_raise ActionController::RoutingError do
      assert_recognizes({:controller => 'devise/passwords', :action => 'new'}, 'admin_area/password/new')
    end
  end

  test 'map account with custom path name for session sign in' do
    assert_recognizes({:controller => 'devise/sessions', :action => 'new', :locale => 'en'}, '/en/accounts/login')
  end

  test 'map account with custom path name for session sign out' do
    assert_recognizes({:controller => 'devise/sessions', :action => 'destroy', :locale => 'en'}, '/en/accounts/logout')
  end

  test 'map account with custom path name for password' do
    assert_recognizes({:controller => 'devise/passwords', :action => 'new', :locale => 'en'}, '/en/accounts/secret/new')
  end

  test 'map account with custom path name for confirmation' do
    assert_recognizes({:controller => 'devise/confirmations', :action => 'new', :locale => 'en'}, '/en/accounts/verification/new')
  end

  test 'map account with custom path name for unlock' do
    assert_recognizes({:controller => 'devise/unlocks', :action => 'new', :locale => 'en'}, '/en/accounts/unblock/new')
  end

  test 'map account with custom path name for registration' do
    assert_recognizes({:controller => 'devise/registrations', :action => 'new', :locale => 'en'}, '/en/accounts/register')
  end
end
