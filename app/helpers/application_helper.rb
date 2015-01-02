module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end
  def description(page_description)
    content_for(:description) { page_description }
  end
  def body_class(the_class)
    content_for(:body_class) { the_class }
  end
  def i18n_opposite
    I18n.locale == :en ? 'sv' : 'en'
  end
  def access_denied_redir
    if user_signed_in?
      edit_user_registration_path
    else
      new_user_session_path
    end
  end
end
