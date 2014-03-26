server '192.168.122.102',
       roles: %w{web app db},
       primary: true,
       ssh_options: {
           user: 'snp-best-practices',
           auth_methods: %w(publickey password ask)
       }