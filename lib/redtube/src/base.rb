require "rest-client"
require "json"

module Redtube
  module Base
    attr_accessor :host, :source, :params
    @@host = "https://api.redtube.com/"
    @@source = "redtube"
    @@params = { output: "json" }


    # private

    def call(url)
      response = RestClient.get(url)
      if response.code == 200
        return JSON.parse(response.body)
      end
      return false
    end

    def build(params)
      query = "?"
      if params && params.length
        params.each do | key, value|
          unless value.nil?
            query << "#{key}=#{value}&"
          end
        end
        return "#{@@host}#{query.slice(0, (query.length-1))}"
      end
      return false
    end

    def run_to_api(data)
      @@params[:data] = data
      call build @@params
    end
  end
end
