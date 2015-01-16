class SuggestionsController < ApplicationController
  load_and_authorize_resource

  def create
    @suggestion = Suggestion.new(suggestion_params)
    if @suggestion.save
      flash[:notice] = t('suggestions.new.created')
      redirect_to new_suggestion_path
    else
      render 'new'
    end
  end

  def new
    @suggestion = Suggestion.new
  end

  def show
    @suggestion = Suggestion.find(params[:id])
  end

  private
    def suggestion_params
      params.require(:suggestion).permit(:content, :email)
    end
end
