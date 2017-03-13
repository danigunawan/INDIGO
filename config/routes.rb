Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'apitests/jsonsamples'
    end
  end

  get 'welcome/progress_chart'

  get 'welcome/samples_table'

  get 'welcome/samples_summary_data'

  get 'kiruploads/index'

  get 'kiruploads/new'

  get 'kiruploads/create'

  get 'hlauploads/index'

  get 'hlauploads/new'

  get 'hlauploads/create'

  get 'hlas/index'

  get 'hlas/new'

  get 'hlas/create'

  get 'dataview/index'

  get 'dataview/download_sample_data'

  get 'dataview/download_hla_data'

  get 'dataview/download_kir_data'

  get 'dataview/download_idr'

  get 'dataview/samples_to_json'

  get 'dataview/hlas_to_json'

  get 'keys/index'

  get 'keys/new'

  get 'keys/create'

  get 'profiles/show'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get 'welcome/index'

  get 'welcome/next'

  get 'welcome/collaborators'

  get 'welcome/abstract'

  get 'welcome/progress'

  get 'welcome/samples_processed'

  root 'welcome#next'

  match '/contacts',     to: 'contacts#new',             via: 'get'
  resources "contacts", only: [:new, :create]

  resources 'keys', only: [:index, :new, :create]

  resources 'hlauploads', only: [:index, :new, :create]

  resources 'kiruploads', only: [:index, :new, :create]

  resources 'dataview', only: [:index]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
