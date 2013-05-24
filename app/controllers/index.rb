get '/' do
  session[:destination] = "/"
  erb :index
end

get '/login' do
  erb :login
end

get '/signup' do
  erb :signup
end

post '/signup' do
  user = User.create(params[:user])
  session[:user_id] = user.id
  redirect to '/'
end

get '/logout' do
  session.clear
  redirect to '/'
end

post '/login' do
  if user = User.authenticate(params[:user])
    session[:user_id] = user.id
    redirect to "#{session[:destination]}"
  else
    redirect to '/login'
  end
end

get '/create' do
  session[:destination] = "/create"
  redirect '/login' unless current_user
  erb :create_survey
end

post '/publish' do
  "PUBLISHED YAY"
end

get '/user/:username' do  
  erb ( current_user.name == params[:username] ? :users : :error )
end

get '/survey/:survey_id/stats' do
  erb :survey_stats
end

# post '/edit' do
#   @survey = Survey.new 
#   @questions = []
#   @options = []

#   @questions << Question.new(params)
#   #inital: make new Survey object, store id, save object as instance variable?
#   #updates survey creation view
#   #takes in new question data, makes new Question object, Options objects
#   #adds question object to questions array (array = instance variable)
#   #adds options objects to options array
#   redirect '/create'
# end

# publishing survey => Survey.create, Question.create, Option.create

get '/survey/:id'
  @survey = Survey.find_by_id(params[:id])
  erb :take_survey
end
