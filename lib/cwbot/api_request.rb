require "net/http"
require "openssl"
require "uri"

module Cwbot
  module ApiRequest
    def self.build_request(url)
      http = Net::HTTP.new(URI.parse(url).host,443)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      return http
    end

    def post_request(url,body,api_key)
      http = build_request(url)
      req = Net::HTTP::Post.new(URI.parse(url).path, {"X-ChatWorkToken" => api_key})
      req.body = "body=#{body}"
      http.start do |h|
        @response = h.request(req)
      end
      return @response
    end

    def get_request(url,api_key)
      http = build_request(url)
      req = Net::HTTP::Get.new(URI.parse(url).path, {"X-ChatWorkToken" => api_key})
      http.start do |h|
        @response = h.request(req)
      end
      return @response
    end
    module_function :post_request,:get_request
  end
end
