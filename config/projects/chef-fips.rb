#
# Copyright 2016 YOUR NAME
#
# All Rights Reserved.
#

name "chef-fips"
maintainer "CHANGE ME"
homepage "https://CHANGE-ME.com"

# Defaults to C:/chef-fips on Windows
# and /opt/chef-fips on all other platforms
install_dir "#{default_root}/#{name}"

build_version Omnibus::BuildVersion.semver
build_iteration 1

override :fips, enabled: true

# Creates required build directories
dependency "preparation"

# chef-fips dependencies/components
dependency "stunnel"

# Version manifest file
dependency "version-manifest"

exclude "**/.git"
exclude "**/bundler/git"
