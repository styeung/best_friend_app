module ApplicationHelper
  
  def auth_token
    <<-HTML.html_safe
      <input type="hidden"
             name="authenticity_token"
             value="#{ form_authenticity_token }">
    
    HTML
  end
  
  def action_modifier(action)
    <<-HTML.html_safe
      <input type="hidden" name="_method" value="#{ action }">
    HTML
  end
end
