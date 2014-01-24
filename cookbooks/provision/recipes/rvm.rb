#
#
# rvm install
#
#



bash "install and setup rvm" do
  cwd "/Users/#{node['current_user']}"
  creates "/Users/#{node['current_user']}/.rvm/"
  code <<-EOH
  STATUS=0
  curl -sSL https://get.rvm.io | bash -s stable -- --ignore-dotfiles || STATUS=1
  echo "source $HOME/.rvm/scripts/rvm" >> $HOME/.bash_profile
  source $HOME/.bash_profile" || STATUS=1
  rvm install 1.9.2 || STATUS=1
  rvm install 2.0.0 || STATUS=1
  rvm install 2.1.0 || STATUS=1
  rvm --default 2.0.0 || STATUS=1
  exit $STATUS
  EOH
end

