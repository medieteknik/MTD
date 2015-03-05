class CompaniesController < ApplicationController
  load_and_authorize_resource

  def show
    @company = Company.where(slug: params[:slug]).first
  end

  def index
    @gold_companies = Company.where(published: true, sponsor: 'gold').order('name asc')
    @silver_companies = Company.where(published: true, sponsor: 'silver').order('name asc')
    @bronze_companies = Company.where(published: true, sponsor: 'bronze').order('name asc')
    @fair_companies = Company.where(published: true, sponsor: 'fair').order('name asc')
  end
end
