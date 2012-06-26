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


  # Frontend routes
  namespace :stats do
    resources :stats, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :stats, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :stats, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :seasons do
    resources :seasons, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :seasons, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :seasons, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :games do
    resources :games, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :games, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :games, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :gamed_players do
    resources :gamed_players, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :gamed_players, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :gamed_players, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
