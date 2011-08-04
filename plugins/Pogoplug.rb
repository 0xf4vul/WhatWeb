##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Pogoplug" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-05
version "0.1"
description "Pogoplug is a device that connects your USB drive to the Internet so you can easily share and access your files from anywhere. To set it up, all that is needed is to plug it into a wall socket, connect the device to your router using an etherent cable and plug a USB drive into the other side of the pogoplug. No network setup is required. - Homepage: http://www.pogoplug.com/products.html"

# Default SSH login credentials #
# root:ceadmin

# ShodanHQ results as at 2011-08-05 #
# 193 for HBHTTP

# Examples #
examples %w|
https://cloudstor.pogoplug.com/
https://my.pogoplug.com/
173.77.25.209
80.117.69.149
173.162.88.214
141.211.155.215
38.104.224.170
77.222.174.210
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	if @meta["server"] =~ /^HBHTTP ([A-Z\d]+) - ([\d\.]+) - Linux$/
		m << { :string =>"#{$1}" }
		m << { :version=>"#{$2}" }
	end

	# Return passive matches
	m
end
end

