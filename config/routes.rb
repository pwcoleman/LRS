Rails.application.routes.draw do

  namespace :xapi, defaults: {format: :json} do
    get 'about' => 'about#index'
    get 'abouts', to: 'errors#error400', default: {error: true, success: false, message: '', code: 400}
    match 'about', to: 'errors#error405', via: [:put, :post, :delete], default: {error: true, success: false, message: '', code: 405}
  end

end
