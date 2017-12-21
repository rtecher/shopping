ActiveAdmin.register User do
  permit_params :name,:surname,:address,:username,:phone
end
