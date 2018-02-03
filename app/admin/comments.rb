ActiveAdmin.register Comment, :as => "ProductComment" do
	menu label: "Ürün Yorumları"
  permit_params :content, :user_id, :product_id, :confirmed
end
