get '/' do
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
    redirect to '/'
  else
    redirect to '/login'
  end
end

get '/create' do
  erb :create_survey
end

post '/create' do
  #inital: make new Survey object, store id, save object as instance variable?
  #updates survey creation view
  #takes in new question data, makes new Question object, Options objects
  #adds question object to questions array (array = instance variable)
  #adds options objects to options array
  erb :create_survey
end

# publishing survey => Survey.create, Question.create, Option.create
