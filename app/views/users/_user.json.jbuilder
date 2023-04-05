json.extract! user, :id, :name, :surname, :patronymic, :fullname, :email, :age, :nationality, :country, :gender, :created_at, :updated_at
json.url user_url(user, format: :json)
