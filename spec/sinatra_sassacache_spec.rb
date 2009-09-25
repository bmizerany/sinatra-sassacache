require File.dirname(__FILE__) + "/../lib/sinatra/sassacache"
require 'rack/test'
require 'fileutils'

describe "Sassacache" do

  before do
    File.unlink "bar.sass" rescue nil
    @app = Class.new(Sinatra::Base)
    @app.set :views, Dir.pwd
    @app.register Sinatra::Sassacache
    @app.template(:foo) { "#foo\n    :color red" }
    @browser = Rack::Test::Session.new(@app)
  end

  it "should add a route for .css files" do
    @browser.get "/foo.css"
    @browser.last_response.should.be.ok
  end

  it "should compile a valid sass template" do
    @browser.get "/foo.css"
    @browser.last_response.body.should.equal "#foo {\n  color: red; }\n"
  end

  it "should compile a valid sass file template" do
    FileUtils.touch "bar.sass"
    @browser.get "/bar.css"
    @browser.last_response.should.be.ok
  end

  it "should 404 if invalid sass file" do
    @browser.get "/not-here.css"
    @browser.last_response.should.be.not_found
  end

  it "should set the Cache-Control header" do
    @browser.get "/foo.css"
    @browser.last_response.headers["Cache-Control"].
      should.equal "public, max-age=2592000"
  end

  it "should set the max-age to options value" do
    @app.set :sassacache_max_age, 99
    @browser.get "/foo.css"
    @browser.last_response.headers["Cache-Control"].
      should.equal "public, max-age=99"
  end

end
