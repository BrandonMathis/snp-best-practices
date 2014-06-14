module Snp
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    desc 'This generator substitutes `cap install` adding S&P specific project settings'
    def add_capistrano_templates
      directory '../templates', '.'
    end
  end
end
