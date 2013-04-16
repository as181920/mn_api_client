require "mn_client/error/client_error"

module MnClient
  class Error
    # Raise when MnClient returns the HTTP status code 404
    class NotFound < MnClient::Error::ClientError
      HTTP_STATUS_CODE = 404
    end
  end
end
