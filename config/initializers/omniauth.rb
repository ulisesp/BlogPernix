Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '276339339133656', 'fe1df5eadfdce050540e70e7b63debb5'
end