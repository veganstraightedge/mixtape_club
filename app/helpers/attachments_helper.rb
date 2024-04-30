module AttachmentsHelper
  def button_to_delete_attachment attachment, classes: nil
    button_to 'Delete',
              "/attachments/#{attachment.id}",
              class: "btn btn-outline-danger btn-sm #{classes}",
              data:  {
                turbo_method:  :delete,
                turbo_confirm: 'Are you sure you’re sure? There is NO UNDO.'
              }
  end
end
