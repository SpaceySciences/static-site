require "sinatra/base"
require "sinatra/activerecord"

class Signup < ActiveRecord::Base
  validates_presence_of :name, :email
end

class NeoGalatic < Sinatra::Base

    enable :sessions

    post "/signup" do
      @name = params[:name]
      @email = params[:email]
      @signup = Signup.create(name: @name, email: @email)
      session[:message] = "You'll recieve more information shortly."
      redirect to("/")
    end

    get "/" do
        @message = session[:message]
        session[:message] = nil
        erb :index
    end

end
