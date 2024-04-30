module DeviseHelper
  def wrapper_row_classes
    'row px-3' if devise_controller?
  end

  def wrapper_columns_classes
    'mt-5 col-12 col-md-10 col-lg-8 col-xl-6 mx-auto' if devise_controller?
  end
end
