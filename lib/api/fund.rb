module ChurchCommunityBuilder

  include Enumerable

  class Fund < ApiObject

    ccb_attr_accessor :id,
                      :name,
                      :cash_bank_account,
                      :account_number,
                      :tax_deductible,
                      :online_giving_enabled,
                      :pledge_goal,
                      :parent,
                      :campuses

    def initialize(json_data = nil, options = {})
      initialize_from_json_object(json_data) unless json_data.nil?
    end


    def parent_id
      self.parent['id']
    end
  end

end
