# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
#Mime::Type.register "application/vnd.ms-pki.stl", :stl

Rack::Mime::MIME_TYPES.merge!({
  ".stl" => "application/vnd.ms-pki.stl"
})
