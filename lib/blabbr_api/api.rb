# encoding: utf-8

class BlabbrApi::Api < Grape::API
  version 'v1', format: :json

  resource :topics do
    get do
      []
    end
  end
end
