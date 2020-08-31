# frozen_string_literal: true

module Api
  module Constraints
    module CompanyInterface
      MATCHER = 'application/vnd.somtething-interesting.company-v1.json'

      def self.matches?(request)
        request.headers['Accept'].include? MATCHER
      end
    end
  end
end
