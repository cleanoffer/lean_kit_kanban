module LeanKitKanban
  module Config
    class NoCredentials < StandardError; end
    class NoAccount < StandardError; end

    class << self
      attr_accessor :debug, :email, :password, :account

      LKK_DOMAIN = 'leankitkanban.com'
      API_SUFFIX = '/Kanban/API'

      def validate
        fail NoCredentials if email.nil? || password.nil?
        fail NoAccount if account.nil?
      end

      def uri
        validate
        "http://#{account}.#{LKK_DOMAIN}#{API_SUFFIX}"
      end

      def basic_auth_hash
        validate
        { basic_auth: { username: email, password: password } }
      end
    end
  end
end