module Users
	LIMIT_USERS_LIST = 30

	def self.show_users()
		db_connect.query("SELECT * FROM Users")
	end

	def self.login_enter(login, password)
		user = db_connect.query("SELECT * FROM Users WHERE login = '#{login}' AND password = '#{password}'")
		result = nil
		user.each do |elem|
			result = elem
		end
		result
	end

	def self.create_user(login, password)
		db_connect.query("INSERT INTO Users VALUES (NULL, 'Ваше имя', 'Ваша фамилия', 'Ваша должность', 'default.jpg', '#{password}','#{login}')")
	end

	def self.search_users(users_list)
		db_connect.query("SELECT * FROM Users WHERE id IN #{users_list}")
	end

	def self.get_user(id)
		user = db_connect.query("SELECT * FROM Users WHERE id = #{id}")
		result = {}
		user.each do |elem|
			elem.each do |key, value|
				result[key] = value
			end
		end
		result
	end

	def self.edit_account(value, name, id)
		db_connect.query("UPDATE Users SET #{value}='#{name}' WHERE id = #{id}")
	end

	def self.edit_image(filename, id)
		db_connect.query("UPDATE Users SET avatar='#{filename}' WHERE id = #{id}")
	end

	def self.get_image(id)
		user = db_connect.query("SELECT image FROM Users WHERE id = #{id}")
		result = ''
		user.each do |elem|
			result = elem['image']
		end
		result
	end

	def self.filter_users_tags(table_name, user_id)
		ivents = Tags::show_tags(table_name, user_id)
		
		ivents_list = '('
		ivents.each do |elem|
			ivents_list += '"' + elem[:name] + '",'
		end
		ivents_list = ivents_list.chop + ')'
		raise "Вы не заполнили интересы" if ivents_list == ')'
		users = Tags::search_user_in_names_tags(table_name, ivents_list, user_id)

		counts = {}
		users.each do |id|
			counts[id["user_id"]] = (counts[id["user_id"]] || 0) + 1
		end
		raise "Сожалеем, но вы Олег! Люди, с похожими интересами не найдены" if counts.empty?
		users_list = '('
		counts.each do |key, value|
			users_list += '"' + key.to_s + '",'
			break if users_list.size > LIMIT_USERS_LIST
		end
		users_list = users_list.chop + ')'

		users_data = self.search_users(users_list)
		users_data.map do |elem|
			elem["count"] = counts[ elem["id"] ]
		end
		return users_data.sort {|x, y| y["count"] <=> x["count"]}
	end

	def self.show_user_goings(going_id)
		db_connect.query("SELECT * FROM Users INNER JOIN goings_people ON Users.id = goings_people.id_user WHERE goings_people.id_going = #{going_id}")
	end
end

