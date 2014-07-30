Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :employees do
    resources :employees, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :employees, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :employees, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
