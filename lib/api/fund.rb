module ChurchCommunityBuilder

  include Enumerable

  class Fund < ApiObject

    ccb_attr_accessor :id,
                      :name,
                      :tax_deductible,
                      :campuses,
                      :online_giving_enabled,
                      :parent

    def initialize(json_data = nil, options = {})

      # When we initialize from CampusReader, the "Campus" is buried
      if json_data["ccb_api"].nil?
        fund_json = json_data
      else
        fund_json = json_data["ccb_api"]["response"]["transaction_detail_types"]["transaction_detail_type"]
      end

      initialize_from_json_object(fund_json) unless fund_json.nil?

    end
  end

end
