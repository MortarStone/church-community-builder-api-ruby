module ChurchCommunityBuilderExceptions
  class UnableToConnectToChurchCommunityBuilder < StandardError; end
  class UnknownErrorConnectingToChurchCommunityBuilder < StandardError; end
  class ChurchCommunityBuilderResponseError < StandardError; end
  class InvalidApiCredentials < StandardError; end
  class QuotaExceeded < StandardError; end
  class TimedOut < StandardError; end
  class NoResponse < StandardError; end
end