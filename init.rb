Redmine::Plugin.register :skills do
  name 'Skills plugin'
  author 'Vladislav Razhnov'
  description 'Skills for InTercom'
  version '0.0.1'
  menu :application_menu, :skills, { :controller => 'skills', :action => 'index' }, :caption => 'Skills'
end
