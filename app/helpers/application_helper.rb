module ApplicationHelper
  def csrf_token
    (<<-HTML).html_safe
      <input type="hidden"
             name="authenticity_token"
             value="#{form_authenticity_token}">
    HTML
  end

  def logout_button
    (<<-HTML).html_safe
      <form action="#{session_url}" method="post">
        #{csrf_token}
        <input type="hidden" name="_method" value="delete">
        <input type="submit" value="logout">
    HTML
  end
end
