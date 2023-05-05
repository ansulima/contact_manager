class SessionsController < ApplicationController
  def new
    redirect_to user_contacts_path(current_user) if user_signed_in?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      redirect_to contacts_path
    else
      flash.now[:danger] = 'Email ou senha invalidos'
      render 'new'
    end
  end

    def sair 
      sign_out
      flash[:warning] = 'Logout com sucesso'
      redirect_to entrar_path
    end
end





=begin

<% if !user_signed_in? %>
<li>
  <%= link_to 'Entrar', entrar_path %>
</li>
<% else %>
<li class="dropdown">
<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
  bem vindo, <%= current_user.name %> <span class="caret"></span>
</a>

<ul class="dropdown-menu">
  <li>
    <%= link_to 'Minha Pagina', current_user %>
  </li>
  <li>
    <%= link_to 'Editar', edit_user_path(current_user) %>
  </li>
  <li class="divider" role="separator"></li>
    <li>
      <%= link_to 'Sair', sair_path %>
    </li>
  </li>
</ul>
</li>
<% end %>
<%= link_to 'Sair', sair_path %>
=end