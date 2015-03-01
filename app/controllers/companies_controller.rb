class CompaniesController < ApplicationController
  load_and_authorize_resource

  def show
    @company = Company.where(slug: params[:slug]).first
  end
end
