
home = node['etc']['passwd'][node['current_user']]['dir']

remote_file "#{Chef::Config[:file_cache_path]}/ohmyzsh_install.sh" do
    source 'https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh'
    owner node['current_user']
    action :create_if_missing
end

execute "Install Oh My Zsh" do
  command   "#{Chef::Config[:file_cache_path]}/ohmyzsh_install.sh"
  not_if    { Dir.exists?("#{home}/.oh-my-zsh") }
end
