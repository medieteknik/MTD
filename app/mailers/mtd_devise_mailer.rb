class MtdDeviseMailer < Devise::Mailer
  before_filter :add_inline_attachment!

  def confirmation_instructions(record, token, opts={})
    super
  end

  def reset_password_instructions(record, token, opts={})
    super
  end

  def unlock_instructions(record, token, opts={})
    super
  end

  private
    def add_inline_attachment!
      attachments.inline['header.png'] = File.read(File.join(Rails.root,'app','assets','images','header','logo@2x.png'))
    end

end
