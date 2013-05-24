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
  create_survey if !@survey     # checks if user is hitting this route from home "create" button or from updating survey creation
  erb :create_survey, :locals => {:survey => @survey, :questions => @questions, :options => @options}
end

post '/publish' do
  "PUBLISHED YAY"
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
