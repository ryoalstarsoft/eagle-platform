module ApplicationHelper

  def bootstrap_class_for flash_type
    { success: "alert-soft-success", error: "alert-soft-danger", alert: "alert-soft-warning", notice: "alert-soft-info" }[flash_type] || "alert-info"
  end

  def bootstrap_icon_for flash_type
    { success: "check_circle", error: "warning", alert: "warning", notice: "info" }[flash_type] || ""
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type.to_sym)} d-flex", role: "alert") do 
              concat content_tag(:i, bootstrap_icon_for(msg_type.to_sym), class: "material-icons mr-3")
              concat content_tag(:div, message, class: "text-body")
              # concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
            end)
    end
    nil
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def active_nav_markup(page, markup=nil)
    if controller_name == page.to_s
      markup || "active" 
    end
  end

  def title(page_title)
    content_for(:title) { page_title }
  end

  def show_action(action)
    case action
    when :add_truck
      action_name == "index"
    end
  end

  def show_left_drawer
    # TODO
    true
  end

  def pagination_prev_markup
    html = content_tag(:span, "chevron_left", {class: "material-icons", "aria-hidden": "true"})
    html << content_tag(:span, "Prev", class: "sr-only")
    html
  end

  def pagination_next_markup
    html = content_tag(:span, "Next", class: "sr-only")
    html << content_tag(:span, "chevron_right", {class: "material-icons", "aria-hidden": "true"})
    html
  end

  def state_array
    [["Alabama", "AL"], ["Alaska", "AK"], ["Arizona", "AZ"], ["Arkansas", "AR"], ["California", "CA"], ["Colorado", "CO"], ["Connecticut", "CT"], ["Delaware", "DE"], ["District Of Columbia", "DC"], ["Florida", "FL"], ["Georgia", "GA"], ["Hawaii", "HI"], ["Idaho", "ID"], ["Illinois", "IL"], ["Indiana", "IN"], ["Iowa", "IA"], ["Kansas", "KS"], ["Kentucky", "KY"], ["Louisiana", "LA"], ["Maine", "ME"], ["Maryland", "MD"], ["Massachusetts", "MA"], ["Michigan", "MI"], ["Minnesota", "MN"], ["Mississippi", "MS"], ["Missouri", "MO"], ["Montana", "MT"], ["Nebraska", "NE"], ["Nevada", "NV"], ["New Hampshire", "NH"], ["New Jersey", "NJ"], ["New Mexico", "NM"], ["New York", "NY"], ["North Carolina", "NC"], ["North Dakota", "ND"], ["Ohio", "OH"], ["Oklahoma", "OK"], ["Oregon", "OR"], ["Pennsylvania", "PA"], ["Rhode Island", "RI"], ["South Carolina", "SC"], ["South Dakota", "SD"], ["Tennessee", "TN"], ["Texas", "TX"], ["Utah", "UT"], ["Vermont", "VT"], ["Virginia", "VA"], ["Washington", "WA"], ["West Virginia", "WV"], ["Wisconsin", "WI"], ["Wyoming", "WY"]]
  end

  def editable_link(field, object, url, options={})
    value = object.send(field)
    html = if options[:formatter]
      "#{options[:formatter].to_s}('#{value}')"
    else
      object.send(field)
    end


    options.merge!({
      'data-editable-inline': true,
      'id': field,
      'data-type': options['data-type'] || 'text',
      'data-pk': object.id,
      'data-url': url,
      'data-value': value,
      'data-turbolinks': false
    })

    link_to eval(html), '#', options
  end

end
