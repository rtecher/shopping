class Product < ApplicationRecord
	has_many :comments
	has_many :sepets
	mount_uploader :image, ImageUploader
	validate :inside_category
	belongs_to :marka

	def inside_category
		categories = ["Enjeksiyon Steroidler", "Peptidler", "Tablet Steroidler"]
		if !categories.include? category
			errors.add(:category, "Kategorilerin dışında")
		end
	end


	def self.search(search)
		if search
			where("title LIKE ?", "%#{search}%")
		else
			all
		end
	end

	def self.filter(filter)
		string = "1=1"
		if filter[:minprice] != ""
			string += " and price>=#{filter[:minprice]}"
		elsif filter[:maxprice] != ""
			string += " and price<=#{filter[:maxprice]}"
		elsif filter[:discounted]
			string += " and discount IS NOT NULL"
		elsif filter[:enj] || filter[:tabl] || filter[:pept]
			string += " and "
			if filter[:enj]
				string += "category='Enjeksiyon Steroidler' or "
			end
			if filter[:tabl]
				string += "category='Tablet Steroidler' or "
			end
			if filter[:pept]
				string += "category='Peptidler' or "
			end
			string = string[0..-4]
		end

		where(string)
			
	end
end
