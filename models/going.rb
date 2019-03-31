module Going
	def self.show_going(day)
		db_connect.query("SELECT * FROM Going WHERE date = #{day} ORDER BY start")
	end

	def self.get_goind(id)
		db_connect.query("SELECT * FROM Going WHERE id = #{id}")
	end

	def self.show_goings_all()
		goings = db_connect.query("SELECT * FROM Going ORDER BY start")
		days = {}
		for i in (1..31)
			days[i] = []
		end
		goings.each do |going|
			days[ going["date"] ] = days[ going["date"] ] || []
			days[ going["date"] ] << going
		end
		days
	end

	def self.add_people_going(user_id, going_id)
		db_connect.query("INSERT INTO goings_people VALUES (NULL, #{user_id}, #{going_id})")
		result = db_connect.query("SELECT count FROM Going WHERE id = #{going_id}")
		result.each do |elem|
			count = elem['count']
		end
		db_connect.query("UPDATA Going SET count=#{count} WHERE id = #{going_id}")
	end


	def self.new_going(title, start, finish, price, count_max, date, tag, text, creater_id)
		db_connect.query("INSERT INTO Going VALUES (NULL, '#{title}', '#{text}', #{start}, #{finish}, #{price}, '#{tag}', #{count_max}, 1, #{date}, #{creater_id})")
	end
end