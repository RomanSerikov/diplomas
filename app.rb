require 'sinatra'
require './lib/api_request'
require './lib/pdf'

configure do
  set :bind, '0.0.0.0'
end

get '/' do
  slim :index
end

post '/create' do
  @owner = params[:owner]
  @repo  = params[:repo]

  @github_response = ApiRequest.new(@owner, @repo).make
  Pdf.new(@github_response).create!

  slim :show
end

get '/diploma/:id' do
  send_file "./output/diploma-#{params[:id]}.pdf"
end
