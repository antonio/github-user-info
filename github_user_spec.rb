require_relative 'github_user'
require 'docnmock_github'

# The documentation is available as a gem, and it includes example responses so
# we don't need to mock anything in our client application.
#
# If the API format changes our tests will fail and this is actually a good
# thing! We don't have to maintain costly mocks in our codebase anymore, the
# owner of the API will do that for us.
Docnmock.api('https://api.github.com').mock

describe GithubUser do

  subject { GithubUser.new('octocat') }

  { login: "octocat",
    id: 1,
    avatar_url: "https://github.com/images/error/octocat_happy.gif",
    gravatar_id: "somehexcode",
    url: "https://api.github.com/users/octocat",
    name: "monalisa octocat",
    company: "GitHub",
    blog: "https://github.com/blog",
    location: "San Francisco",
    email: "octocat@github.com",
    hireable: false,
    bio: "There once was...",
    public_repos: 2,
    public_gists: 1,
    followers: 20,
    following: 0,
    html_url: "https://github.com/octocat",
    created_at: "2008-01-14T04:33:35Z",
    type: "User"
  }.each do |key, value|

    it "returns the #{key}" do
      expect(subject.public_send(key)).to eq(value)
    end

  end
end
