source 'https://supermarket.chef.io'

cookbook 'omnibus'
cookbook 'chef-fips',
	 path: File.expand_path("cookbooks/chef-fips", File.dirname(__FILE__))

# Uncomment to use the latest version of the Omnibus cookbook from GitHub
# cookbook 'omnibus', github: 'opscode-cookbooks/omnibus'

group :integration do
  cookbook 'apt',      '~> 2.8'
  cookbook 'freebsd',  '~> 0.3'
  cookbook 'yum-epel', '~> 0.6'
end
