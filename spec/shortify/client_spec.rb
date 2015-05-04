require "spec_helper"

describe Shortify::Client do
  let(:host) { "localhost:8080" }
  let(:username) { "testuser" }
  let(:password) { "730a094dd48d4991b9bd17e1cb35c422" }
  let(:subject) { Shortify::Client.new(host, username, password) }

  it "stores base_uri and credentials" do
    expect(subject.base_uri).to eq("http://#{host}")
    expect(subject.username).to eq(username)
    expect(subject.password).to eq(password)
  end

  context "#short_url_for", :vcr do
    context "with valid url and params" do
      it "creates a short url for the supplied target url" do
        url = subject.short_url_for("http://www.google.com/")
        expect(url).to_not be_nil
        expect(url.scheme).to eq("http")
        expect(url.hostname).to eq("localhost")
        expect(url.port).to eq(8080)
        expect(url.path[1..-1]).to_not be_empty
      end
    end

    context "with invalid credentials" do
      let(:subject) { Shortify::Client.new(host, "testuser", "badPassword") }

      it "raises an authentication error" do
        expect { subject.short_url_for("http://www.google.com/") }.to raise_error(Shortify::AuthenticationError)
      end
    end

    context "with invalid params" do
      it "raises a params error with empty url param" do
        expect { subject.short_url_for("") }.to raise_error(Shortify::ParamsError)
      end
    end
  end
end
