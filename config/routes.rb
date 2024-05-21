Rails.application.routes.draw do
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:path_username", { :controller => "users", :action => "show" })
  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:path_id", { :controller => "photos", :action => "show" })
  get("/delete_photo/:toast_id", { :controller => "photos", :action => "baii" })

  post("/insert_photo", { :controller => "photos", :action => "create" })
  post("/update_photo/:modify_id", { :controller => "photos", :action => "update" })
  post("/add_comment", { :controller => "comments", :action => "create" })

  post("/add_user", { :controller => "users", :action => "create" })  # New route for adding users
end
