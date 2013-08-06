class Product < ActiveRecord::Base
	validates :title, :description, :image_url, :price, :presence=>true
	validates :price, :numericality=>{:greater_than_or_equal_to => 0.01}
	validates :title, :uniqueness=>true
	validates :image_url, :format => {
		:with => /\.(jpg|png|gif)/,
		:message => "You must input a correct file type, like jpg."
	}
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item

	private
	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			errors.add(:base, "Line items presence")
			return false
		end
	end
end
