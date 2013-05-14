module ChurchCommunityBuilder

  include Enumerable

  class Address < ApiObject
    
    # Type = {mailing: 'mailing', home: 'home', work: 'work', other: 'other'}

    ccb_attr_accessor :type,
											:street_address,
											:city,
											:state,
											:zip,
											:country,
											:line_1,
											:line_2,
											:latitude,
											:longitude
											

    def initialize(json)
    	initialize_from_json_object(json) unless json.nil?
    end


  end

end