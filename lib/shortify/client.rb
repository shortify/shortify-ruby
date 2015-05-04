class Shortify::Client
  CREATE_ENDPOINT = "/redirects".freeze

  attr_reader :base_uri, :username, :password

  def initialize(base_uri, username, password)
    @base_uri = HTTParty.normalize_base_uri(base_uri)
    @username = username
    @password = password
  end

  def short_url_for(target_url)
    post_options = options.merge(body: { url: target_url }.to_json)
    response = HTTParty.post(CREATE_ENDPOINT, post_options)
    fail error_for_response(response) unless response.key?("token")

    URI.parse("#{base_uri}/#{response['token']}") if response.key?("token")
  end

  private

  def options
    @options ||= {
      base_uri: base_uri,
      basic_auth: { username: username, password: password }
    }
  end

  def error_for_response(response)
    message = response["text"]

    case response["code"].to_i
    when 401 then Shortify::AuthenticationError.new(message)
    when 422 then Shortify::ParamsError.new(message)
    else Shortify::Error.new(message)
    end
  end
end
