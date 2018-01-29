ActiveAdmin.register User do
	menu label: "Kullanıcılar"
  permit_params :name,:surname,:address,:username,:phone
end
