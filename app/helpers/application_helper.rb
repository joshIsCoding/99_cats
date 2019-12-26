module ApplicationHelper
   def auth_token
      input_string = "<input "
      input_string += "type=\"hidden\" "
      input_string += "name=\"authenticity_token\" "
      input_string += "value=\"#{form_authenticity_token}\" />"
      input_string.html_safe
   end
end
