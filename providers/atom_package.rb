
use_inline_resources

action :install do

  execute "apm install #{new_resource.name}" do
    command   %{apm install '#{new_resource.name}'}
    not_if    %{apm list --bare | grep '^#{new_resource.name}'}
  end

end
