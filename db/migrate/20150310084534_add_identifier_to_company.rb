class AddIdentifierToCompany < ActiveRecord::Migration
  # add dummy class to make sure this migration doesnt brake on further updates
  class Company < ActiveRecord::Base
  end

  def change
    add_column :companies, :identifier, :string

    # update each company
    Company.find_each do |c|
      c.identifier = SecureRandom.urlsafe_base64
      c.save!
    end
  end
end
