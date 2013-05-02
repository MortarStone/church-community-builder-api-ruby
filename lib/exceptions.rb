module ChurchCommunityBuilderExceptions
  class UnableToConnectToChurchCommunityBuilder < StandardError; end
  class UnknownErrorConnectingToChurchCommunityBuilder < StandardError; end
  class ChurchCommunityBuilderResponseError < StandardError; end
end