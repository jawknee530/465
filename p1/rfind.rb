#!/usr/bin/env ruby
files = `find .`.split.sort.keep_if {|arg| arg =~ /(\.(rb|erb|js|css|html|yml|txt))$/}
puts "Files with names that matches <#{ARGV[0]}>"
files.each {|arg| if arg =~ /#{ARGV[0]}/ then puts "  #{arg}" end}
puts "**************************************************"
puts "Files with content that matches <#{ARGV[0]}>"
titles = files.map {|arg| if `grep -i -n #{ARGV[0]} #{arg}`.length > 1 then arg end}.compact
titles.each {|arg| puts arg
             a = `grep -i -n #{ARGV[0]} #{arg}`.split("\n")
             a.each {|x| puts "  #{x}"}
             puts "--------------------------------------------------" if arg != titles.last}
