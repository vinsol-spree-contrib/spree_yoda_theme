module Spree
  HomeController.class_eval do

    include ProductRetriever
    prepend HomeControllerHelper
  end
end
