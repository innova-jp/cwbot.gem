require "cwbot/version"
require "cwbot/api_request"

module Cwbot

  class Cwbot
    attr_accessor :api_key

    def initialize(key)
      if key !~ /[a-z|0-9]+/
        raise CwbotException, "invalid api key"
        return
      end

      @api_key = key
      @api_url = "https://api.chatwork.com/v2"
    end

    def get_rooms
      url = @api_url+"/rooms"
      res = ApiRequest.get_request(url,@api_key)
    end

    def post_message(to_room,body)
      url = @api_url+"/rooms/#{to_room}/messages"
      res = ApiRequest.post_request(url,body,@api_key)
    end
  end

  class CwbotException < Exception; end

end
