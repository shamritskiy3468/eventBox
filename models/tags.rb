module Tags
	def self.show_tags(table_name, user_id)
		result = db_connect.query("SELECT id, name FROM #{table_name} WHERE user_id = #{user_id}")
		ivents = []
		result.each do |elem|
			ivents << {:name => elem['name'], :id => elem['id']}
		end
		ivents
	end

	def self.add_tag(table_name, user_id, name)
		db_connect.query("INSERT INTO #{table_name} VALUES (NULL, '#{name}', #{user_id})")
	end

	def self.remove_tag(table_name, id)
		db_connect.query("DELETE FROM #{table_name} WHERE id = #{id}")
	end

	def self.search_user_in_names_tags(table_name, names, id)
		db_connect.query("SELECT user_id FROM #{table_name} WHERE name IN #{names} AND NOT user_id = #{id}")
	end

end