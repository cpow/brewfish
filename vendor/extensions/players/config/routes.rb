Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :players do
    resources :players, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :players, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :players, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
