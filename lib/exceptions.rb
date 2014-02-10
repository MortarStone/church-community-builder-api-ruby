module ChurchCommunityBuilderExceptions
  class UnableToConnectToChurchCommunityBuilder < StandardError; end
  class UnknownErrorConnectingToChurchCommunityBuilder < StandardError; end
  class ChurchCommunityBuilderResponseError < StandardError; end
  class InvalidApiCredentials < StandardError; end
end