def db_connect
	client = Mysql2::Client.new(
		:host => "127.0.0.1",
		:username => "root",
		:password => "Admin_root_1234", 
		:database => "test"
	)
end
