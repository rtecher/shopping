ActiveAdmin.register Product do
  menu label: "Ürünler"
  permit_params :title,:description, :image, :trademark,:price,:discount,:category, :marka_id
  form do |f|
  	f.inputs "Upload", :multipart => true do
  		f.input :title, required: true
  		f.input :description, required: true
  		f.file_field :image, required: true
  		f.input :trademark, required: true
  		f.input :price, required: true
  		f.input :discount
      f.label :category, "category" 
      f.select :category, options_for_select(["Enjeksiyon Steroidler", "Peptidler", "Tablet Steroidler"])
      f.input :marka
  		#f.input :category, required: true
  	end
  	f.actions
  end
end
