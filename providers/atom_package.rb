
use_inline_resources

action :install do

  execute "Install APM Package #{new_resource.name}" do
    command   %{apm install '#{new_resource.name}'}
    not_if    %{apm info '#{new_resource.name}'}
  end

end
