#
# Cookbook Name::web-php5
# Recipe:: web-php5_54_repo
#

apt_repository "ondrej-old-php" do
  uri "http://ppa.launchpad.net/ondrej/php5-oldstable/ubuntu"
  distribution node["lsb"]["codename"]
  components ["main"]
  keyserver node["php5"]["keyserver"]
  key node["php5"]["key_ondrej_old"]
  action :add
  notifies :run, 'execute[apt-get update]', :immediately
end

apt_preference "ondrej-old-php-pin" do
  glob '*'
  pin 'origin http://ppa.launchpad.net/ondrej/php5-oldstable/ubuntu'
  pin_priority '999'
  notifies :run, "execute[apt-get update]", :immediately
end

