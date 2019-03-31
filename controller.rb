require "sinatra"
require "mysql2"
require 'json'
require "./components/db"
require "./models/records"
require "./models/messages"
require "./models/users"
require "./models/tags"
require "./models/going"

include FileUtils::Verbose

enable :sessions

def check_enter_user
	redirect to('/enter/') unless session['id']
end

def validate_email(email)
  /[a-z\d(\.\-\_)?]+@profitero\.com/.match?(email.downcase)
end

def validate_password(password)
  /^([\w\d]+){8,}$/.match?(password)
end

get "/" do
	check_enter_user
	@users = Users::show_users
	@days = Going::show_goings_all
	# return @days.to_s
	erb :index
end


post "/edit_image/" do
	# Users::get_image(session["id"]).to_json
	tempfile = params[:file][:tempfile] 
    filename = params[:file][:filename] 
    cp(tempfile.path, "public/images/upload/#{filename}")
    Users::edit_image(filename, session["id"])
    redirect to('/myaccount/') 

end

get "/enter/" do
	erb :enter
end

get "/registr/" do
	erb :registr
end

post "/new_user/" do
	raise "Неверный email. Необходима почта profitero"	unless validate_email(params["login"])
	raise "Пароль слишком простой"	unless validate_password(params["password"])
	# return "INSERT INTO Users VALUES (NULL, 'Ваше имя', 'Ваша фамилия', 'Ваша должность', 'default.jpg', '#{params['password']}','#{params['login']}')"
	Users::create_user(params['login'], params['password'])
	redirect to('/enter/')
end

get "/add/" do
	check_enter_user
	erb :form
end

get "/record/:id" do
	check_enter_user
	@record = Records::page_record(params['id'])
	erb :record
	
end

get "/new_record/" do
	check_enter_user
	erb :form
end

post "/add_record/" do
	check_enter_user
	Records::add_record(params['title'], params['text'])
	redirect to('/')
end

post "/change_record/" do
	check_enter_user
 	Records::change_record(params['id'], params['title'], params['text'])
end

get "/delete_record/:id" do
	check_enter_user
 	Records::delete_record(params['id'])
end

post "/add_tags/" do
	check_enter_user
	Tags::add_tag(params['table'], params['user_id'], params['name'])
end

post "/remove_tag/" do
	check_enter_user
	Tags::remove_tag(params['table'], params['id'])
end

get  "/filter_users_tags/:get" do
	check_enter_user
	get_value = params["get"].split('&')
	table = get_value[0].split('=')[1]
	id = get_value[1].split('=')[1]
	#Переделать!
	@users = Users::filter_users_tags(table, id)
	erb :users
end

get "/myaccount/" do
	check_enter_user
	@user = Users::get_user(session['id'])
	@ivents = Tags::show_tags("Ivents", session['id'])
	@foot = Tags::show_tags("Foot", session['id'])
	@interes = Tags::show_tags("Interes", session['id'])
	@days = Going::show_goings_all
	erb :acount
end


get "/account/:id" do
	check_enter_user
	redirect to('/myaccount/') if session['id'] == params['id']
	@user = Users::get_user(params['id'])
	@ivents = Tags::show_tags("Ivents", params['id'])
	@foot = Tags::show_tags("Foot", params['id'])
	@interes = Tags::show_tags("Interes", params['id'])
	@days = Going::show_goings_all
	erb :user_acount
end

get "/create_message/:id" do 
	check_enter_user
	@user_id = params['id']
	erb :create_message
end

get "/mymessages/" do 
	check_enter_user
	@messages = Message::show_messages(session["id"])
	erb :messages
end

post "/send_message/" do
	Message::send_message(params["title"], params["text"], session["id"], params["adressant_id"])
	redirect("/account/#{params["adressant_id"]}")
end

post "/edit_account/" do
	check_enter_user
	Users::edit_account(params['value'], params['name'], params['index'])
end

post "/login_enter/" do
	enter = Users::login_enter(params['login'], params['password'])
	raise "Неверный логин или пароль" unless enter
	session['id'] = enter['id'].to_s
	session['name'] = enter['name']
	redirect to('/')
end


get "/going/:id" do
	check_enter_user
	result = Going::get_goind(params["id"])
	@going = nil
	result.each do |elem|
		@going = elem
	end
	erb :going
end

get "/create_going/:day" do
	check_enter_user
	@day = params["day"] 
	erb :create_going
end

post "/new_going/" do
	check_enter_user
	Going::new_going(params["title"], params["start"], params["finish"], params["price"], 
		params["count_max"], params["date"], params["tag"], params["text"], session["id"])
	redirect to('/myaccount/')

end

get "/add_people_going/:id" do
	Going::add_people_going(session["id"], params["id"])
	# redirect to('/myaccount/')
end

get "/show_going/:day" do
	@goings = Going::show_going(params["day"])
	# @goings.to_json
end


not_found do
	status 404
	"Something wrong! Try to type URL correctly or call to UFO."
end