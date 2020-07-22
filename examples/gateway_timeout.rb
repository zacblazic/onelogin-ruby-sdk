require 'onelogin'
require 'pry-byebug'

client = OneLogin::Api::Client.new(
    client_id: 'x',
    client_secret:'x',
    region: 'us'
)

while true do
  users = client.get_users.to_a
  users.each do |user|
    apps = client.get_user_apps(user.id).to_a
    puts "#{user.email} has access to #{apps.count} apps"
  end
end
