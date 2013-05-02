module ChurchCommunityBuilderExceptions
  class UnableToConnectToTheCity < StandardError; end
  class UnknownErrorConnectingToTheCity < StandardError; end
  class TheCityResponseError < StandardError; end
end