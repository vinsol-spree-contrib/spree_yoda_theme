module Spree
  module Admin
    module ProductsControllerHelper
      def edit
        @badges = Spree::Badge.all
        super
      end
    end
  end
end
