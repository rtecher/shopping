ActiveAdmin.register Product do
  permit_params :title,:description, :image, :trademark,:price,:discount,:category
  form do |f|
  	f.inputs "Upload", :multipart => true do
  		f.input :title, required: true
  		f.input :description, required: true
  		f.input :image, as: :file, required: true
  		f.input :trademark, required: true
  		f.input :price, required: true
  		f.input :discount
  		f.input :category, required: true
  	end
  	f.actions
  end
end
