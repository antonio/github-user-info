require 'net/http'
require 'json'
require 'forwardable'

API = 'https://api.github.com'

class GithubUser
  extend Forwardable

  attr_reader :user

  ATTRS = [:login, :id, :avatar_url, :gravatar_id, :url, :name, :company,
           :blog, :location, :email, :hireable, :bio, :public_repos,
           :public_gists, :followers, :following, :html_url, :created_at,
           :type]

  def_delegators :user, *ATTRS

  def initialize(login)
    response = Net::HTTP.get resource_url(login)
    @user = OpenStruct.new(JSON.parse(response))
  end

  private

  def resource_url(login)
    URI("#{API}/users/#{login}")
  end

end
