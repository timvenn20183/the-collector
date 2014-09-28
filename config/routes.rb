Rails.application.routes.draw do

  root 'main#index'

  match 'search' => 'main#search', via: :get
  match 'contact' => 'main#contact', via: :get
  match 'contact_process' => 'main#process_contact', via: :post
  match 'blogs' => 'blog#index', via: :get
  match 'gallery' => 'gallery#index', via: :get
  match 'contact/:id' => 'main#contact', via: :get
  match 'links' => 'main#links', via: :get

  match 'collection' => 'collection#index', via: :get
  match 'items' => 'collection#index', via: :get
  match 'collection/:id' => 'virtualcollection#view', via: :get
  match 'collection/:itemfield/:id' => 'fieldoption#view', via: :get
  match 'items/:id' => 'item#view', via: :get

  match 'blogs/:id/edit' => 'blog#edit', via: :get
  match 'blogs/:id' => 'blog#view', via: :get
  match 'blog_process' => 'blog#process_blog', via: :post
  match 'blog/new' => 'blog#new', via: :get

  resources :items
  resources :blogs

end
