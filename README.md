# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

  # <%= f.select :role, User.roles.keys.map { |r| [r.to_s.capitalize, r] } %>

<--- Devise Functions>
    def after_sign_in_path_for(resource)
    if resource.is_a?(User)
     users_show_path(resource)
    else
      super
    end
  end

  def after_sign_up_path_for(resource)
    if resource.is_a?(User)
      users_show_path(resource)
    else
      super
    end
  end