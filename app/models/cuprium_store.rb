require 'pstore'
module CupriumStore
  module ClassMethods
    def cuprium_store
      @cuprium_store ||= PStore.new("cuprium_store_#{Rails.env}.pstore")
    end
    # Used for locked things outside the current transaction
    def new_cuprium_store
      PStore.new("cuprium_store_#{Rails.env}.pstore")
    end
  end
  
  module InstanceMethods
    def cuprium_store
      self.class.cuprium_store
    end
    def new_cuprium_store
      self.class.new_cuprium_store
    end
  end
  
  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end