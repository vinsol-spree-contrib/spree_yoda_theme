module Spree
  UsersController.class_eval do
    prepend UsersControllerHelper
  end
end
