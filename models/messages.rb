module Message
	def self.show_messages(id)
		db_connect.query("SELECT * FROM Messages WHERE adressant_id = #{id}")
	end

	def self.send_message(title, text, sender_id, adressant_id)
		db_connect.query("INSERT INTO Messages VALUES (NULL, '#{title}', '#{text}', #{sender_id}, #{adressant_id})")
	end
end