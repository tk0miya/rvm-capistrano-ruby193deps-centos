require "rvm-capistrano-ruby193deps-centos/version"
require "capistrano-platform-recognizer"


Capistrano::Configuration.instance.load do
  namespace :rvm do
    namespace :ruby193deps do
      namespace :centos do
        desc "Install build dpendencies of Ruby"
        task :install do
          pkgs = %w(gcc-c++ git patch readline readline-devel zlib zlib-devel libyaml-devel libxml2-devel libxslt-devel
                    libffi-devel openssl-devel make bzip2 autoconf automake libtool bison iconv-devel)
          run "#{sudo} yum -y install #{pkgs.join(" ")}", :shell => 'bash'
        end
        before 'rvm:install_ruby', 'rvm:ruby193deps:centos:install'

        namespace :centos5 do
          task(:install_i386,
               :only => {:distro => :centos5, :arch => :i386},
               :except => { :no_release => true },
               :on_no_matching_servers => :continue) do
            install(:i386)
          end
          before 'rvm:install_ruby', 'rvm:ruby193deps:centos:centos5:install_i386'

          task(:install_x86_64,
               :only => {:distro => :centos5, :arch => :x86_64},
               :except => { :no_release => true },
               :on_no_matching_servers => :continue) do
            install(:x86_64)
          end
          before 'rvm:install_ruby', 'rvm:ruby193deps:centos:centos5:install_x86_64'

          def install(arch)
            urls = %w(http://dl.fedoraproject.org/pub/epel/5/x86_64/perl-Error-0.17010-1.el5.noarch.rpm
                      http://dl.fedoraproject.org/pub/epel/5/x86_64/perl-Git-1.7.4.1-1.el5.x86_64.rpm
                      http://dl.fedoraproject.org/pub/epel/5/x86_64/git-1.7.4.1-1.el5.x86_64.rpm
                      http://dl.fedoraproject.org/pub/epel/5/x86_64/libffi-3.0.5-1.el5.x86_64.rpm
                      http://dl.fedoraproject.org/pub/epel/5/x86_64/libffi-devel-3.0.5-1.el5.x86_64.rpm
                      http://dl.fedoraproject.org/pub/epel/5/x86_64/libyaml-0.1.2-3.el5.x86_64.rpm
                      http://dl.fedoraproject.org/pub/epel/5/x86_64/libyaml-devel-0.1.2-3.el5.x86_64.rpm
                      http://dl.iuscommunity.org/pub/ius/stable/Redhat/5/x86_64/autoconf26x-2.63-4.ius.el5.noarch.rpm)

            filenames = []
            urls.each do |url|
              url.gsub!('x86_64', arch.to_s)
              filename = "/tmp/#{File.basename(url)}"

              run "wget -O #{filename} #{url}", :shell => 'bash'
              filenames << filename
            end

            run "#{sudo} rpm -ivh #{filenames.join(" ")} || true", :shell => 'bash'
            run "rm #{filenames.join(" ")}", :shell => 'bash'
          end
        end

        namespace :centos6 do
          task(:install_i386,
               :only => {:distro => :centos6, :arch => :i386},
               :except => { :no_release => true },
               :on_no_matching_servers => :continue) do
            install(:i386)
          end
          before 'rvm:install_ruby', 'rvm:ruby193deps:centos:centos6:install_i386'

          task(:install_x86_64,
               :only => {:distro => :centos6, :arch => :x86_64},
               :except => { :no_release => true },
               :on_no_matching_servers => :continue) do
            install(:x86_64)
          end
          before 'rvm:install_ruby', 'rvm:ruby193deps:centos:centos6:install_x86_64'

          def install(arch)
            urls = %w(http://dl.fedoraproject.org/pub/epel/6/x86_64/libyaml-0.1.3-1.el6.x86_64.rpm
                      http://dl.fedoraproject.org/pub/epel/6/x86_64/libyaml-devel-0.1.3-1.el6.x86_64.rpm)

            filenames = []
            urls.each do |url|
              url.gsub!('x86_64', arch.to_s)
              filename = "/tmp/#{File.basename(url)}"

              run "wget -O #{filename} #{url}", :shell => 'bash'
              filenames << filename
            end

            run "#{sudo} rpm -ivh #{filenames.join(" ")} || true", :shell => 'bash'
            run "rm #{filenames.join(" ")}", :shell => 'bash'
          end
        end
      end
    end
  end
end
