module Api
  module V1
    class EmailGeneratorsController < ApplicationController

      def create
        # This is a placeholder for the email generator
        render json: { message: "Email generated" }, status: :created
      end

    end
  end
end
