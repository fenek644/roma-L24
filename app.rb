require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
  end

get '/contacts' do
	erb :contacts
end


post '/visit' do
  @user_name = params[:username]
  @phone = params[:phone]
  @date_time = params[:date_time]

  @master = params[:master]
  @color = params[:colorpicker]

  f = File.open './public/user.txt', 'a'
  f.puts "User: #{@user_name}, Phone: #{@phone}, Date and Time: #{@date_time} . Ваш мастер - #{@master}. "
  f.close

  erb :visit_mess
  # erb "OK #{@user_name}; вы записаны на #{@date_time}; ваш мастер #{@master}; выбранный цвет #{@color}"
end

post '/contacts' do
  @email = params[:email]
  @message = params[:message]

  f = File.open './public/contacts.txt', 'a'
  f.puts "email: #{@email}, Сообщение: #{@message}. "
  f.close

  erb :contacts
end


