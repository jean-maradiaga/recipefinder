module ApplicationHelper

  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end

  def is_active(controller, action)       
    params[:action] == action && params[:controller] == controller ? "current" : nil        
  end

end
