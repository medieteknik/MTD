$ ->
  $('#s3_uploader').S3Uploader
    remove_completed_progress_bar: false
    progress_bar_target: $('#uploads_container')
    before_add: assureImage
  $('#s3_uploader').bind 's3_upload_failed', (e, content) ->
    alert content.filename + ' failed to upload'
  return

assureImage = (file) ->
  console.log "Uploading file of type", file.type
  return ['image/gif', 'image/jpeg', 'image/png'].indexOf(file.type) > -1
