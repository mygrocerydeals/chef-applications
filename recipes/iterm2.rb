

homebrewalt_cask "iterm2"

directory "#{Chef::Config[:file_cache_path]}/iterm2" do
  owner node['current_user']
  action :create
end

cookbook_file "iterm2/TomorrowNightEighties.itermcolors" do
  path "#{Chef::Config[:file_cache_path]}/iterm2/TomorrowNightEighties.itermcolors"
  action :create_if_missing
end

bash 'install_tomorrow_night_eighties_theme' do
  code <<-EOH
    /usr/libexec/PlistBuddy -c "Add :'Custom Color Presets':'Tomorrow Night Eighties' dict" ~/Library/Preferences/com.googlecode.iterm2.plist
    /usr/libexec/PlistBuddy -c "Merge '#{Chef::Config[:file_cache_path]}/iterm2/TomorrowNightEighties.itermcolors' :'Custom Color Presets':'Tomorrow Night Eighties'" ~/Library/Preferences/com.googlecode.iterm2.plist
    EOH
end
