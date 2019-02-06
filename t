[1mdiff --git a/app/controllers/entries_controller.rb b/app/controllers/entries_controller.rb[m
[1mindex b9d05ee..1c845ca 100644[m
[1m--- a/app/controllers/entries_controller.rb[m
[1m+++ b/app/controllers/entries_controller.rb[m
[36m@@ -45,9 +45,9 @@[m [mclass EntriesController < ApplicationController[m
     end[m
   end[m
 [m
[31m-  # def my_bookmarks[m
[31m-  #   @my_bookmarks = current_user.bookmarks[m
[31m-  # end[m
[32m+[m[32m  def my_bookmarks[m
[32m+[m[32m    @my_bookmarks = current_user.bookmarks[m
[32m+[m[32m  end[m
 [m
   def bee[m
     @comment = Comment.find(params[:id])[m
[1mdiff --git a/app/views/components/_sidebar.html.erb b/app/views/components/_sidebar.html.erb[m
[1mindex 68c123e..8403699 100644[m
[1m--- a/app/views/components/_sidebar.html.erb[m
[1m+++ b/app/views/components/_sidebar.html.erb[m
[36m@@ -6,32 +6,45 @@[m
     <i class="fas fa-bars shadowless"></i>[m
   </div>[m
   <div class="sidebar-content">[m
[31m-    <h2>SV-App</h2>[m
[32m+[m
     <%= link_to entries_path do %>[m
[31m-      <i class="fas fa-home">[m
[31m-        <span> Timeline</span>[m
[32m+[m[32m      <i class="far fa-paper-plane">[m
[32m+[m[32m        <span> Start</span>[m
       </i>[m
     <% end %>[m
[32m+[m
     <%= link_to user_path(current_user) do  %>[m
       <i class="fas fa-user">[m
         <span> Mein Profil</span>[m
       </i>[m
     <% end %>[m
[32m+[m
[32m+[m[32m    <%= link_to my_bookmarks_path do %>[m
[32m+[m[32m      <i class="fas fa-bookmark">[m
[32m+[m[32m        <span> Lesezeichen</span>[m
[32m+[m[32m      </i>[m
[32m+[m[32m    <% end %>[m
[32m+[m
     <%= link_to users_path do %>[m
       <i class="fas fa-users">[m
[31m-        <span> SV-Mitglieder</span>[m
[32m+[m[32m        <span> SV</span>[m
       </i>[m
     <% end %>[m
[31m-    <%#= link_to my_bookmarks_path do %>[m
[31m-      <!-- <i class="fas fa-bookmark">[m
[31m-        <span> Meine Lesezeichen</span>[m
[31m-      </i> -->[m
[31m-    <%# end %>[m
[32m+[m
[32m+[m[32m    <% if current_user.super_admin? %>[m
[32m+[m[32m      <%= link_to admin_users_path do %>[m
[32m+[m[32m        <i class="fas fa-cogs">[m
[32m+[m[32m          <span> SuperAdmin</span>[m
[32m+[m[32m        </i>[m
[32m+[m[32m      <% end %>[m
[32m+[m[32m    <% end %>[m
[32m+[m
     <div id="log-out-div">[m
       <%= link_to(destroy_user_session_path, method: 'delete', class: "sidebar-icon-blue") do %>[m
         <h3>LOG OUT <i class="fas fa-sign-out-alt shadowless"></i></h3>[m
       <% end %>[m
     </div>[m
[32m+[m
   </div>[m
 </nav>[m
 [m
[1mdiff --git a/app/views/users/index.html.erb b/app/views/users/index.html.erb[m
[1mindex fc74bc7..b1c310c 100644[m
[1m--- a/app/views/users/index.html.erb[m
[1m+++ b/app/views/users/index.html.erb[m
[36m@@ -3,19 +3,17 @@[m
   <% @users.each do |user| %>[m
       <div class="author-infos big list-item justify-content-between">[m
     <%= link_to user_path(user) do  %>[m
[31m-        <div class="avatar avatar-medium" id="author-pic" style="background-image: url(<%= asset_path 'amelie.png' %>);">[m
[31m-        </div>[m
[31m-        <div>[m
[31m-          <h3 class="red-font bold-font"><%= user.first_name %> <%= user.second_name %> </h3>[m
[31m-        </div>[m
[31m-      <% end %>[m
[32m+[m[32m        <div class="avatar avatar-medium" id="author-pic" style="background-image: url(<%= asset_path 'amelie.png' %>);"></div>[m
[32m+[m[32m        <h3 class="red-font bold-font"><%= user.first_name %> <%= user.second_name %></h3>[m
[32m+[m[32m    <% end %>[m
         <div class="edit-user mr-5">[m
             <%= render 'components/edit_user_modal', user: user %>[m
         </div>[m
[31m-        <div id= 'clicky-button' data-toggle="modal" data-target=<%= "#edit-user-model-#{user.id}"%>>[m
[31m-          Update Role <i class="fas fa-edit"></i>[m
[31m-        </div>[m
[32m+[m[32m        <% if current_user.admin? || current_user.super_admin? %>[m
[32m+[m[32m          <div id= 'clicky-button' data-toggle="modal" data-target=<%= "#edit-user-model-#{user.id}"%> ><%= user.role.capitalize %>[m
[32m+[m[32m            <i class="fas fa-pen"></i>[m
[32m+[m[32m          </div>[m
[32m+[m[32m        <% end %>[m
       </div>[m
[31m-[m
   <% end %>[m
 </div>[m
[1mdiff --git a/config/routes.rb b/config/routes.rb[m
[1mindex 98b77ad..bc32a53 100644[m
[1m--- a/config/routes.rb[m
[1m+++ b/config/routes.rb[m
[36m@@ -20,5 +20,5 @@[m [mRails.application.routes.draw do[m
   post '/entries/:id/comments', to: 'entries#add_comment', as: 'add_comment'[m
   get 'entries/:id/bookmark', to: 'entries#bookmark', as: 'bookmark'[m
 [m
[31m-  # get 'bookmarks', to: 'entries#my_bookmarks', as: 'my_bookmarks'[m
[32m+[m[32m  get 'bookmarks', to: 'entries#my_bookmarks', as: 'my_bookmarks'[m
 end[m
