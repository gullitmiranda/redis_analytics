require 'spec_helper'

describe Rack::RedisAnalytics::Filter do

  before do
    @mock_request = Rack::Request.new(:ip => "127.0.0.1", :path => '/ignored')
    @mock_response = Rack::Response.new(:content_type => "text/csv")
  end

  context "when a Filter matches" do
    it "should return true" do
      filter = Rack::RedisAnalytics::Filter.new Proc.new {|req, res| req.ip == @test_request.ip and res.content_type == @test_response.content_type}
      filter.matches?(@test_request, @test_response).should be_true
    end
  end

  context "when a string PathFilter matches" do
    it "should return true" do
      filter = Rack::RedisAnalytics::PathFilter.new(@test_request.path)
      filter.matches?(@test_request.path).should be_true
    end
  end

end
