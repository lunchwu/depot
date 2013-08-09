class Cart < ActiveRecord::Base
	has_many :line_items, :dependent => :destroy
	def add_product(product_id)
		current_item = self.line_items.find_by_product_id(product_id)
		if current_item
			current_item.quantity += 1
		else
			# cart_id may be set in the following "build" function
			current_item = line_items.build(:product_id => product_id)
		end
		current_item
	end
	def total_price
		line_items.to_a.sum do |item| item.total_price end
=begin
		@total_price = 0
		line_items.each do |item|
			@total_price += item.total_price
		end
		@total_price
=end
	end
end
