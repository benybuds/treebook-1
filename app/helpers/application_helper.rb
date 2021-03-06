module ApplicationHelper
  
  def can_display_status?(status)
    signed_in? && !current_user.has_blocked?(status.user) || !signed_in?
  end

  def status_document_link(status)
    if status.document && status.document.attachment?
      content_tag(:span , "Attachment", class: "label label-info") +
      link_to(status.document.attachment_file_name, status.document.attachment.url)
    end
  end

  def flash_class(type)
    case type
      when :alert
        "alert-danger"
      when :notice
        "alert-success"
      else
        ""
    end

  end
  
end
