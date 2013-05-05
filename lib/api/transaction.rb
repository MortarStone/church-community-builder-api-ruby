module ChurchCommunityBuilder

  include Enumerable

  class Transaction < ApiObject

  	ccb_attr_accessor :id,
											:campus,
											:individual,
											:date,
											:grouping,
											:payment_type,
											:check_number,
											:transaction_details,
											:creator,
											:modifier,
											:created,
											:modified

									

  	def initialize(json_data = nil, options = {})
			initialize_from_json_object(json_data) unless json_data.nil?

			if json_data["transaction"].nil?
      	transaction_json = json_data
      else
      	transaction_json = json_data["transaction"]
      end
      
      	initialize_from_json_object(transaction_json) unless transaction_json.nil?
  	end


    # def self.load_by_id(transaction_id)
    #   reader = TransactionReader.new(transaction_id)
    #   self.new(reader.load_feed)
    # rescue
    #   nil
    # end

  end

end