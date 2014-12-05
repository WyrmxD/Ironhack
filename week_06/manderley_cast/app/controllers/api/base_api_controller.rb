class Api::BaseApiController < ApplicationController
  rescue_from 'ActiveRecord::RecordNotFound' do |exception|
    head :not_found
  end
end
