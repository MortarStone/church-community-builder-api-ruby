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
                  

    def self.load_by_id(batch_id)
      reader = BatchReader.new(batch_id)
      self.new(reader.load_feed)
    rescue
      nil
    end


    def initialize(json_data = nil, options = {})
      initialize_from_json_object(json_data) unless json_data.nil?

      if json_data["ccb_api"].nil?
        batch_json = json_data
      else
        batch_json = json_data["ccb_api"]["response"]["batches"]["batch"]
      end
      
        initialize_from_json_object(batch_json) unless batch_json.nil?
    end


    def has_transactions?
      !self.transactions.nil?
    end
  end

end
