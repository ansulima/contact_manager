<ul class="nav navbar-nav navbar-right">

      <% if !user_signed_in? %>
        <li>
          <%= link_to 'Entrar', entrar_path %>
        </li>
      <% else %>
          <li>
            <a href="#" >
              bem vindo, <%= current_user.name %> 
            </a>
          </li>
          
          <li>
            <%= link_to 'Minha Pagina', user_contacts_path(current_user) %>
          </li>

          <li>
              <%= link_to 'Editar', edit_user_path(current_user) %>
          </li>
          <li class="divider" role="separator"></li>
          <li>
            <%= link_to 'Sair', sair_path %>
          </li>  
      <% end %>
      </ul> 