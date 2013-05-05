module ChurchCommunityBuilder

  include Enumerable

  class Batch < ApiObject

  	ccb_attr_accessor :id,
  										:campus,
											:post_date,
											:begin_date,
											:end_date,
											:in_accounting_package,
											:status,
											:source,
											:transactions,
											:creator,
											:modifier,
											:created,
											:modified
									

  	def initialize(json_data = nil, options = {})
			initialize_from_json_object(json_data) unless json_data.nil?

			# if json_data["ccb_api"].nil?
   #    	individual_json = json_data
   #    else
   #    	individual_json = json_data["ccb_api"]["response"]["batches"]["batch"]
   #    end
      
   #    	initialize_from_json_object(individual_json) unless individual_json.nil?
  	end

  end

end
