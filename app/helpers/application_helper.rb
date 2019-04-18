module ApplicationHelper
  def full_title page_title
    # base_title = I18n.t "helper.application.base_title"
    base_title = t ".fastfood"
    if page_title.blank?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
