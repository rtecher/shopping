class Product < ApplicationRecord
	has_many :comments
	has_many :sepets
	has_attached_file :image, styles: { small: "320x150#" ,slider: "800x300#" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


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
