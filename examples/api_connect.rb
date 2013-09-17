#!/usr/bin/env ruby

subdomain = '*** YOUR CHURCH SUBDOMAIN ***'
username = '*** YOUR CHURCH API USERNAME ***'
password = '*** YOUR CHURCH API PASSWORD ***'

ChurchCommunityBuilder::Api.connect(username, password, subdomain)