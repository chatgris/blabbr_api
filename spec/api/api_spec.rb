# encoding: utf-8
require 'spec_helper'

describe BlabbrApi::Api, type: :requests do
  let!(:current_user) {
    BlabbrCore::Persistence::User.new(nickname: 'nickname', email: 'email@email.com')
  }
  let(:member) {
    BlabbrCore::Persistence::User.new(nickname: 'member', email: 'member@email.com')
  }
  let(:topic) {
    BlabbrCore::Persistence::Topic.create(author: current_user, title: "Title please !")
  }
  let(:topic_by_member) {
    BlabbrCore::Persistence::Topic.create(author: member, title: "Title please !")
  }

  describe "GET /v1/topics" do
    context 'without topics' do
      it "returns an empty array of topics" do
        get "/v1/topics", {}, {'current_user' => current_user}
        last_response.status.should == 200
        JSON.parse(last_response.body).should == []
      end
    end

    context 'with topics' do

      before do
        topic
        get "/v1/topics", {}, {'current_user' => current_user}
      end

      it "should have a topic in list" do
        last_response.status.should == 200
        JSON.parse(last_response.body).first['author_id'].should eq current_user.id.to_s
      end

      it 'should have a result do' do
        last_response.status.should == 200
        JSON.parse(last_response.body).size.should eq 1
      end
    end
  end

  describe "GET /v1/topics/limace" do
    context 'without topics' do
      it "returns an empty array of topics" do
        expect {
          get "/v1/topics/#{topic_by_member.limace}", {}, {'current_user' => current_user}
        }.should raise_error
      end
    end

    context 'with topics' do

      before do
        topic
        get "/v1/topics/#{topic.limace}", {}, {'current_user' => current_user}
      end

      it "should have a topic in list" do
        last_response.status.should == 200
        JSON.parse(last_response.body)['author_id'].should eq current_user.id.to_s
      end

    end
  end
end
