#!/usr/bin/env ruby
puts "Files with names that matches <#{ARGV[0]}>"
(files = `find .`.split.sort.keep_if {|x| x =~ /(\.(rb|erb|js|css|html|yml|txt))$/}.keep_if {|x| `grep -i -n #{ARGV[0]} #{x}`.length > 0}).each {|x| if x =~ /#{ARGV[0]}/ then puts "  #{x}" end}
puts "*"*50+"\nFiles with content that matches <#{ARGV[0]}>"
files.each {|x| puts x
             (a = `grep -i -n #{ARGV[0]} #{x}`.split("\n")).each {|x| puts "  #{x}"}
             puts "-"*50 if x != files.last}
