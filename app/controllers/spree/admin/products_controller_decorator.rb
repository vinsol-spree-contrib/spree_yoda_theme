module Spree
  module Admin
    ProductsController.class_eval do
      include ProductsControllerHelper
    end
  end
end
