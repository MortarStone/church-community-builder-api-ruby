module ChurchCommunityBuilder

  class DonationWriter < ApiWriter

    # Constructor.
    #
    # @param data The json object data to save.
    def initialize(data)
      @url_data_path   = {srv: "online_giving_insert_gift"}.merge(data)
      @url_action      = :post

      @updatable_fields = [ #required fields
                           :coa_category_id,
                           :individual_id,
                           :amount,

                           #optional fields
                           :merchant_transaction_id,
                           :merchant_authorization_code,
                           :merchant_notes,
                           :first_name,
                           :last_name,
                           :phone,
                           :email,
                           :street_address,
                           :city ,
                           :state,
                           :zip,
                           :payment_method_type]
    end

  end

end


















