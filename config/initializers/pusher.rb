require 'pusher'

Pusher.app_id = '401237'
Pusher.key = '194f0bfe827f047fcf64'
Pusher.secret = 'e54ac78b93ad78aa7f60'
Pusher.cluster = 'us2'
Pusher.logger = Rails.logger
Pusher.encrypted = true

# app/controllers/hello_world_controller.rb
class HelloWorldController < ApplicationController
  def hello_world
    Pusher.trigger('my-channel', 'my-event', {
      message: 'hello world'
    })
  end
end

