class Dog < ApplicationRecord
has_many :user_dogs
has_many :users, through: :user_dogs

# @dogs = []

# def self.get_dogs_from_api
#     response_string = RestClient.get("https://dog.ceo/api/breed/bullterrier/images")
#     response_hash = JSON.parse(response_string)
#     response_hash.message.each do |url| url["link"]
#       @dogs << url["link"]
#     end
 
#     @dogs.each do |dog|
#         dog = Dog.find_or_create_by(url: dog)
#     end
# end

end
