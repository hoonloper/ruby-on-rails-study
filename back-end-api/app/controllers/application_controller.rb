class ApplicationController < ActionController::Base
  # authentication 미필요
  protect_from_forgery with: :null_session

  # set default user
  def default_user
    user = User.first

    # nil과 blank 용도차이(false, 공백값 유효성 등)
    if user.blank?
      user = User.create(name: "test", email: "email@email.com")
    end
    user
  end
end
