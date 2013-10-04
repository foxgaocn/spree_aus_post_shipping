class Spree::AusPostShippingConfiguration < Spree::Preferences::Configuration

  preference :origin_postcode, :string, :default => '3000'
  preference :default_weight, :integer, :default => 3.0
  preference :default_height, :integer, :default => 30
  preference :default_width, :integer, :default => 30
  preference :default_length, :integer, :default => 30
  preference :service_types, :string, :default => ['aus_parcel_regular']
  preference :api_key, :string
  


end