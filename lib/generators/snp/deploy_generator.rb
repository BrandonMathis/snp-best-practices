module Snp
  class DeployGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    desc 'Prepares application to deploy and add custom stages. Defaults are `testing` and `production`.'
    def add_deploy_templates
      directory 'deploy', '.'
    end
  end
end
