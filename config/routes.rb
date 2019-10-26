Simpler.application.routes do
  get '/tests', 'tests#index'
  post '/tests', 'tests#create'

  get '/tests', 'tests#show'
  get '/tests', 'tests#:id'
end
