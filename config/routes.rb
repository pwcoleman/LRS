Rails.application.routes.draw do

  namespace :admin do
    resources :lrs, only: [:index] do
      resources :statements, only: [:index]
      resources :activity_states, ony: [:index]
      resources :activity_profiles, ony: [:index]
      resources :agent_profiles, ony: [:index]
    end
  end

  namespace :xapi, defaults: {format: :json} do
    # NB all the xapi routes have been created manually rather than using the Rails resource style as the LRS spec
    # doesn't use standard CRUD routes

    get 'about' => 'about#index'
    get 'abouts', to: 'errors#error400', default: {error: true, success: false, message: '', code: 400}
    match 'about', to: 'errors#error405', via: [:put, :post, :delete], default: {error: true, success: false, message: '', code: 405}

    # statements
    get 'statements' => 'statements#index'
    post 'statements' => 'statements#create'
    put 'statements' => 'statements#update'
    match 'statement', to: 'errors#error400', via: [:get, :put, :post, :delete], default: {error: true, success: false, message: '', code: 400}

    # activity states
    get 'activities/state' => 'activity_states#index'
    post 'activities/state' => 'activity_states#create'
    put 'activities/state' => 'activity_states#update'
    delete 'activities/state' => 'activity_states#destroy'
    match 'activities/states', to: 'errors#error400', via: [:get, :put, :post, :delete], default: {error: true, success: false, message: '', code: 400}
    match 'activity/state', to: 'errors#error400', via: [:get, :put, :post, :delete], default: {error: true, success: false, message: '', code: 400}

    # activity profiles
    get 'activities/profile' => 'activity_profiles#index'
    post 'activities/profile' => 'activity_profiles#create'
    put 'activities/profile' => 'activity_profiles#update'
    delete 'activities/profile' => 'activity_profiles#destroy'
    match 'activities/profiles', to: 'errors#error400', via: [:get, :put, :post, :delete], default: {error: true, success: false, message: '', code: 400}
    match 'activity/profile', to: 'errors#error400', via: [:get, :put, :post, :delete], default: {error: true, success: false, message: '', code: 400}

    # agent profiles
    get 'agents/profile' => 'agent_profiles#index'
    post 'agents/profile' => 'agent_profiles#create'
    put 'agents/profile' => 'agent_profiles#update'
    delete 'agents/profile' => 'agent_profiles#destroy'
    match 'agents/profiles', to: 'errors#error400', via: [:get, :put, :post, :delete], default: {error: true, success: false, message: '', code: 400}
    match 'agent/profile', to: 'errors#error400', via: [:get, :put, :post, :delete], default: {error: true, success: false, message: '', code: 400}

    match 'activities', to: 'errors#error400', via: [:get, :put, :post, :delete], default: {error: true, success: false, message: '', code: 400}
    match 'agents', to: 'errors#error405', via: [:get, :put, :post, :delete], default: {error: true, success: false, message: '', code: 405}

  end

  root to: 'admin/lrs#index'

end
