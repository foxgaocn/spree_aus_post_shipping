require 'spec_helper'


describe Spree::Calculator::AusPost do

	# let!(:tax_category) { create(:tax_category, :tax_rates => []) }
	# let!(:rate) { mock_model(Spree::TaxRate, :tax_category => tax_category, :amount => 0.05) }
	let!(:order) { create(:order, 
		:line_items => [ line_item_1, line_item_2 ], :ship_address => ship_address ) }
	let!(:calculator) { Spree::Calculator::AusPost.new() } 
	let!(:line_item_1) { create(
		:line_item,
		:product => product_1,
		:price => 10,
		:quantity => 3,
		:variant => create(:variant, :weight => nil ) ) }
	let!(:line_item_2) { create(:line_item, :product => product_2, :price => 5, :quantity => 1,
		:variant => create(:variant, :weight => nil ) ) }
	let!(:product_1) { create(:product, :name => "BlueBox") }
	let!(:product_2) { create(:product, :name => "RedBox") }
	let!(:ship_address) { create(:address, :city => 'Brisbane', :zipcode => '4000') }

	context "get configuration parameters" do
		context "when given an order" do
			before do
				# class Spree::AusPostShipping::Config
				# end
				Spree::AusPostShipping::Config = { 
					:default_weight=> 1.0,
					:default_height => 30,
					:default_width => 30,
					:default_length => 30, 
					:origin_postcode => '3000',
					:api_key => 'XXXXXXXXXX',
					:service_types => ['aus_parcel_regular']
				 }

#				 @rest_client = mock( ::RestClient )
#				 ::RestClient.stub!(:get).and_return("what the hell was that!")

			end

			it "should be 0" do
	  			calculator.compute(order).should == 0
	  		end
	  	end
	end

	it "contacts the web service"
	it "extracts the shipping fees"
	it "calculates the gst amount"
	it "applies the fees and gst to the order"
end
