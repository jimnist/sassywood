##
# tasks for maintaining and deploying this jekyll site
#
# adapted and simplified from:
#    http://davidwparker.com/2009/12/01/my-jekyll-rake-file/
#
# relies on public key being set up for the user on the host

USER_NAME = "git8"
HOST_NAME = "jimnist.com"
SITE_NAME = "sassywood.org"

desc "build and run the site locally"
task :run => :build do
  puts "running server locally"
  system('jekyll --server ./jekyll ./site')
end

desc "build _site locally"
task :build => :delete do
  puts "building jekyll/_site"
  system('compass compile')
  system('jekyll ./jekyll ./site')
end

desc "deploy #{SITE_NAME} to AWS"
task :deploy => :rsync do
  puts "dev site deployed"
  puts "TODO"
end

desc "deletes jekyll/_site"
task :delete do
  puts "deleting _site"
  system('rm -r jekyll/_site')
  puts "deleting _site complete"
end

desc "rsync site"
task :rsync => :build do
  system("rsync -avrz site/ #{USER_NAME}@#{HOST_NAME}:#{SITE_NAME}")
end

###
# this (will) has tasks to publish, run the dev server, etc
desc "run jekyll and compass dev servers"
task :dev do
  system "./scripts/dev_servers.sh"
end
