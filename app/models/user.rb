class User < ActiveRecord::Base
  has_many  :user_surveys
  has_many  :surveys, :through => :user_surveys
  has_many  :surveys
  has_many  :responses
  has_many  :options, :through => :responses

  validates :name, :length => { :minimum => 3, :message => "must be at least 3 characters, fool!" }
  validates :entered_password, :length => { :minimum => 6 }
  validates :email, :uniqueness => true, :format => /\w+@\w+\.\w{2,3}/ # imperfect, but okay

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @password = Password.create(pass)
    self.password_hash = @password
  end

  
  def self.create(options={})
    @user = User.new(:email => options[:email])
    @user.password = options[:password]
    @user.save!
    @user
  end

  def self.authenticate(params)
    user = User.find_by_email(params[:email])
    (user && user.password == params[:password]) ? user : nil
  end
end
