require "httparty"

module Shortify
  class Error < StandardError; end
  class AuthenticationError < Error; end
  class ParamsError < Error; end
end

require "shortify/version"
require "shortify/client"
