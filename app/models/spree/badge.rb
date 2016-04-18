module Spree
  class Badge < ActiveRecord::Base
    has_many :products, class_name: 'Spree::Product'

    validates :name, presence: true
  end
end
