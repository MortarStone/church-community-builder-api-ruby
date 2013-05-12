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

    def campus_id
      self.campus["id"]
    end

    def campus_name
      self.campus["content"]
    end

    def individual_id
      self.individual["id"]
    end

    def individual_name
      self.individual["content"]
    end

    def multiple_transactions?
      self.transaction_details["transaction_detail"].is_a?(Array)
    end

    def transaction_amount

      if multiple_transactions?
        trans_ary = []
        self.transaction_details["transaction_detail"].each {|trans| ary << trans["amount"]}
        return trans_ary
      
      else
        self.transaction_details["transaction_detail"]["amount"]
      
      end

    end

    # def self.load_by_id(transaction_id)
    #   reader = TransactionReader.new(transaction_id)
    #   self.new(reader.load_feed)
    # rescue
    #   nil
    # end

  end

end