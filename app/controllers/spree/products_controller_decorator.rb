module Spree
  ProductsController.class_eval do

    include ProductRetriever
    prepend ProductsControllerHelper

  end
end
