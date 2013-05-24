class User < ActiveRecord::Base
  has_many  :surveys, :foreign_key => :creator_id
  has_many  :responses
  has_many  :options, :through => :responses

  validates :name, :length => { :minimum => 3, :message => "must be at least 3 characters, fool!" }, :uniqueness => true
  validates :email, :uniqueness => true, :format => /\w+@\w+\.\w{2,3}/ # imperfect, but okay

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @password = Password.create(pass)
    self.password_hash = @password
  end

  
  def self.create(params={})
    @user = User.new(:email => params[:email], :name => params[:name])
    @user.password = params[:password]
    @user.save!
    @user
  end

  def self.authenticate(params)
    user = User.find_by_name(params[:name])
    (user && user.password == params[:password]) ? user : nil
  end
end
