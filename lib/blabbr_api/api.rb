# encoding: utf-8

class BlabbrApi::Api < Grape::API
  version 'v1', format: :json

  helpers do
    def current_user
      env['current_user']
    end
  end

  get '/me' do
    current_user
  end

  put '/me' do
    # TODO: expose errors in a cleaner way
    user = BlabbrCore::User.new(current_user, current_user.limace)
    if user.update(params[:user])
      current_user.reload
    else
      error! user.send(:resource).errors.as_json, 412
    end
  end

  resource :users do
    get do
      BlabbrCore::UsersCollection.new(current_user).all.to_a
    end

    get ':limace' do
      BlabbrCore::User.new(current_user, params[:limace]).find
    end
  end

  resource :topics do
    get do
      BlabbrCore::TopicsCollection.new(current_user).all.to_a
    end

    get ':limace' do
      BlabbrCore::Topic.new(current_user, params[:limace]).find
    end
  end
end
