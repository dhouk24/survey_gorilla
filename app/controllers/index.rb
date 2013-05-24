get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/login' do

erb :login

end

get '/signup' do

end

post '/signup' do

end

post '/logout' do

end

post '/login' do
  
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
