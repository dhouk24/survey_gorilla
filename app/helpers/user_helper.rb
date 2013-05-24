def current_user
  User.where(:id => session[:user_id]).first
end

# def create_survey
#   @survey = ""
#   @questions = []
#   @options = []
# end
