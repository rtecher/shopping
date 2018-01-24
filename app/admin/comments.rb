ActiveAdmin.register Comment, :as => "ProductComment" do
  permit_params :content
end
