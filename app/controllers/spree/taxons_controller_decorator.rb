module Spree
  TaxonsController.class_eval do
    include ProductRetriever
  end
end
