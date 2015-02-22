

homebrewalt_cask "iterm2"

home = node['etc']['passwd'][node['current_user']]['dir']

cookbook_file "com.googlecode.iterm2.plist" do
  path "#{home}/Library/Preferences/com.googlecode.iterm2.plist"
  source "iterm2/com.googlecode.iterm2.plist"
  action :create_if_missing
end
