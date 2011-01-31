##
# tasks for maintaining and deploying this jekyll site
#
# adapted and simplified from:
#    http://davidwparker.com/2009/12/01/my-jekyll-rake-file/
#
# relies on public key being set up for the user on the host

USER_NAME = "ubuntu"
STAGING_HOST = "reggie.loco8.org"
PRODUCTION_HOST = "einche.loco8.org"
SITE_DIR = "/apps/sassywood"

desc "build and run the site locally"
task :run => :build do
  puts "running server locally"
  system('jekyll --server ./jekyll ./site')
end

desc "build site locally"
task :build => :delete do
  puts "building site"
  system('compass compile')
  system('jekyll ./jekyll ./site')
end

desc "deletes site"
task :delete do
  puts "deleting site"
  system('rm -r site')
  puts "deleting site complete"
end

###
# this (will) has tasks to publish, run the dev server, etc
desc "run jekyll and compass dev servers"
task :dev do
  system "./scripts/dev_servers.sh"
end

namespace :deploy do

  desc "deploy sassywood to #{STAGING_HOST}"
  task :staging => :build do
    cmd = "rsync -avrz site/ #{USER_NAME}@#{STAGING_HOST}:#{SITE_DIR}"
    puts cmd
    system cmd
    puts "staging site deployed"
  end

  desc "deploy sassywood to #{PRODUCTION_HOST}"
  task :production => :build do
    cmd = "rsync -avrz site/ #{USER_NAME}@#{PRODUCTION_HOST}:#{SITE_DIR}"
    puts cmd
    system cmd
    puts "production site deployed"
  end
end
