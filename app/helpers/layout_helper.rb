module LayoutHelper
  def flash_class flash_type
    {
      success: 'alert-success',
      error:   'alert-danger',
      notice:  'alert-info',
      alert:   'alert-danger',
      warn:    'alert-warning'
    }[flash_type.to_sym]
  end
end
