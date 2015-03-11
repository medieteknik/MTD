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

  def edit
    @company = Company.where(slug: params[:slug], identifier: params[:identifier]).first

    unless @company
      redirect_to root_url
    end
  end

  def update
    company = Company.where(slug: params[:slug], identifier: params[:identifier]).first
    if company.update_attributes(company_params)
      flash[:notice] = t('companies.edit.success')
    else
      flash[:notice] = t('companies.edit.error')
    end
    redirect_to company_edit_path(company.slug, company.identifier)
  end

  private
    def company_params
      params.require(:company).permit(:first_day_booth_id, :second_day_booth_id)
    end

    def current_ability
      company = Company.where(slug: params[:slug]).first
      @current_ability ||= Ability.new(current_user, company, params[:identifier])
    end
end
