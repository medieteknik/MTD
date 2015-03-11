$(document).ready ->
  $('.booth-img .choose:not(.disabled)').click ->
    self = this
    # get the target selector from the clicked on-thingy, and set it to the value
    # from the clicked on-thingy
    #
    # jquery <3
    $($(self).attr('data-target')).val($(self).attr('data-value'))
