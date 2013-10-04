module Spree
  module AusPostShipping

  end
end

module SpreeAusPostShipping
  class Engine < Rails::Engine
    engine_name 'spree_auspost_shipping'

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/models/spree/calculator/*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    # Use RSpec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    config.autoload_paths += %W(#{config.root}/lib)
    config.to_prepare &method(:activate).to_proc

    initializer "spree.aus_post_shipping.preferences", :before => :load_config_initializers do |app|
      Spree::AusPostShipping::Config = Spree::AusPostShippingConfiguration.new
    end

    # initializer "spree_aus_post_shipping.register.calculators" do |app|
    #   Dir.glob(File.join(File.dirname(__FILE__), "../../app/models/spree/calculator/*.rb")) do |c|
    #     Rails.env.production? ? require(c) : load(c)
    #   end
    # 
    #   app.config.spree.calculators.shipping_methods += [ Spree::Calculator::AusPost]
    #   
    # end

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

  end
end

