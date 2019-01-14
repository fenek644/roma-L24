require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
  # @error = "something wrong!!!"
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

  hh = {
      :username => "Введите имя",
      :phone => "Введите номер телефона",
      :date_time => "Введите дату и время посещения"
  }

  @error = hh.select {|key, | params[key] == ""}.values.join(", ")

  if @error != ""
    return  erb :visit
  else
    @error = NIL
  end


  f = File.open './public/user.txt', 'a'
  f.puts "User: #{@user_name}, Phone: #{@phone}, Date and Time: #{@date_time} . Ваш мастер - #{@master}. "
  f.close

  erb :visit_mess
  # erb "OK #{@user_name}; вы записаны на #{@date_time}; ваш мастер #{@master}; выбранный цвет #{@color}"
end

post '/contacts' do
  @email = params[:email]
  @message = params[:message]


    hh = {
        :email => "Введите адрес электронной почты",
        :message => "Ваше сообщение пусто - введите текст сообщения",
    }

    @error = hh.select {|key, | params[key] == ""}.values.join(", ")

    if @error != ""
      return  erb :contacts
    else
      @error = NIL
    end


  f = File.open './public/contacts.txt', 'a'
  f.puts "email: #{@email}, Сообщение: #{@message}. "
  f.close

  erb "Спасибо за оращение, в ближайшее время вам ответят"
  # erb :contacts
end


