<%= form_for @comment do |f| %>
    <%= f.label :content %>
    <%= f.text_field :content %>
<% end %>

<button><%= link_to "Back To Listing", listing_path(@comment.listing) %></button>