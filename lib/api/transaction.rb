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
      return false if self.transaction_details.nil?
      self.transaction_details["transaction_detail"].is_a?(Array)
    end

    def transaction_detail_id
      return nil if self.transaction_details.nil?
      if multiple_transactions?
        self.transaction_details["transaction_detail"].each{ |trans| trans["id"] }
      else
        self.transaction_details["transaction_detail"]["id"]
      end
    end

    def fund_id
      return nil if self.transaction_details.nil?
      if multiple_transactions?
        self.transaction_details["transaction_detail"].each{ |trans| trans["coa"]["id"] }
      else
        self.transaction_details["transaction_detail"]["coa"]["id"]
      end
    end    

    def fund_name
      return nil if self.transaction_details.nil?
      if multiple_transactions?
        self.transaction_details["transaction_detail"].collect{ |trans| trans["coa"]["content"] }
      else
        self.transaction_details["transaction_detail"]["coa"]["content"]
      end
    end

    def amount
      return nil if self.transaction_details.nil?
      if multiple_transactions?
        self.transaction_details["transaction_detail"].collect{ |trans| trans["amount"] }     
      else
        self.transaction_details["transaction_detail"]["amount"]      
      end
    end


    def as_splits
      return nil if self.transaction_details.nil?
      vals = []
      if multiple_transactions?
        self.transaction_details["transaction_detail"].each_with_index do |trans, indx| 
          vals << {:transaction_detail_id => trans['id'],
                   :fund_id => trans["coa"]["id"],
                   :fund_name => trans["coa"]["content"],
                   :amount => self.transaction_details["transaction_detail"][indx]["amount"]}
        end
      else 
        vals << {:transaction_detail_id => self.transaction_details["transaction_detail"]["id"],
                 :fund_id => self.transaction_details["transaction_detail"]["coa"]["id"],
                 :fund_name => self.transaction_details["transaction_detail"]["coa"]["content"],
                 :amount => self.transaction_details["transaction_detail"]["amount"]}
      end
      return vals
    end

    # def self.load_by_id(transaction_id)
    #   reader = TransactionReader.new(transaction_id)
    #   self.new(reader.load_feed)
    # rescue
    #   nil
    # end

  end

end