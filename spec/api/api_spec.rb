# encoding: utf-8
require 'spec_helper'

describe BlabbrApi::Api do
  describe "GET /v1/statuses", type: :requests do
    it "returns an empty array of statuses" do
      get "/v1/topics"
      last_response.status.should == 200
      JSON.parse(last_response.body).should == []
    end
  end
end
