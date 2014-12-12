require 'devise'

module ControllerMacros
  def login_admin
    before {sign_in :admin_user, FactoryGirl.create(:admin_user)}
  end

  def as_guest
    before {controller.stub(:current_admin_user) { nil }}
  end
end