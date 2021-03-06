require 'sinatra'

module Gyazo
  module Server
    class WebServer < Sinatra::Base

      set :root, "#{File.dirname(__FILE__)}/../../../"

      post '/' do
        id = request[:id]
        data = request[:imagedata][:tempfile].read
        image = Image.new(options.root, id, data)

        "http://#{settings.host}:#{settings.port}/data/#{image.hash}.png"
      end

    end
  end
end
