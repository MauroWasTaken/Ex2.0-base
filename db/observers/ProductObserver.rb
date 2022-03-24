require 'rails/observers/activerecord/active_record'
class ProductObserver < ActiveRecord::Observer
    observe :product
  
    def after_create(model)
      # envoi du mail de notification
    end
  end