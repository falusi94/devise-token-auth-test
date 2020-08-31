Rails.application.routes.draw do
  scope constraints: Api::Constraints::CompanyInterface do
    mount_devise_token_auth_for 'Employee', at: 'auth'
  end

  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
