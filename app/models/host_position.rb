class HostPosition < ActiveRecord::Base
  translates :position, :fallbacks_for_empty_translations => true
  globalize_accessors
end
