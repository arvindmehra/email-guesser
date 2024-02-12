# frozen_string_literal: true

module Api
  module V1
    class EmailGuesserController < ApplicationController
      def analyze
        first_name = params[:first_name]
        last_name = params[:last_name]
        domain = params[:domain]

        if first_name.blank? || last_name.blank? || domain.blank?
          render json: { error: 'Missing required parameters: first_name, last_name, domain' }, status: :bad_request
          return
        end
        service =  EmailAnalyzerService.new(first_name, last_name, domain)
        email = service.call

        if email
          render json: { email: }, status: :ok
        else
          render json: { error: 'Email format for given domain not found' }, status: :not_found
        end
      end
    end
  end
end
