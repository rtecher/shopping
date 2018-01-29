ActiveAdmin.register Comment, :as => "ProductComment" do
	menu label: "Ürün Yorumları"
  permit_params :content, :confirmed
end
