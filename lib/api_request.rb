require 'httparty'

class ApiRequest
  def initialize(owner, repo)
    @owner = owner
    @repo  = repo
  end

  def make
    HTTParty.get(url)
  end

  private

  def url
    "https://api.github.com/repos/#{@owner}/#{@repo}/contributors"
  end
end
