Rails.application.routes.draw do

  # NB all the routes have been created manuulay rather than using the Rails resource style as the LRS spec
  # doesn't use standard CRUD routes
  namespace :xapi, defaults: {format: :json} do
    get 'about' => 'about#index'
    get 'abouts', to: 'errors#error400', default: {error: true, success: false, message: '', code: 400}
    match 'about', to: 'errors#error405', via: [:put, :post, :delete], default: {error: true, success: false, message: '', code: 405}

    get 'statements' => 'statements#show'
    post 'statements' => 'statements#create'
    put 'statements' => 'statements#update'
  end

end
