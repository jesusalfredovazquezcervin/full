Myapp::Application.routes.draw do
  resources :steps

  resources :procedures

# patch "captures/consultar/:id", to: "captures#consultar", as: "captures_consultar"
  get "fields/index/:id", to: "fields#index", as: "field_form"
  get "fields/new/:id", to: "fields#new", as: "new_field_form"

  resources :form10s

  resources :form9s

  resources :form8s

  resources :form7s

  resources :form6s

  resources :form5s

  resources :form4s

  resources :form3s

  resources :form2s

  resources :form1s

  resources :fields

  resources :forms

  resources :order_details

  resources :orders

  resources :products

  patch "clientes/update_tipocambio", to: "clientes#update_tipocambio", as: "update_tipocambio"
  resources :notifications

  resources :statuses

  resources :events

  #get "consultar/:id", to: "captures#consultar", as: 'consultar_cliente'
  #get "captures/consultar", to: "captures#consultar", as: 'captures_consultar_cliente'
  #post "captures/consultar"
  patch "captures/consultar/:id", to: "captures#consultar", as: "captures_consultar"

  resources :agendas

  devise_scope :usuario do
    get "usuarios", to: "usuarios/registrations#index"
    get "usuarios_desactivar/:id", to: "usuarios/registrations#desactivar", as: 'usuarios_desactivar'
    get "usuarios_activar/:id", to: "usuarios/registrations#activar", as: 'usuarios_activar'
  end


  devise_for :usuarios, controllers:{
                 sessions:'usuarios/sessions',
                 passwords: 'usuarios/passwords',
                 registrations: 'usuarios/registrations'
                      }






  get 'countries/update_cities', as: 'update_cities'
  get 'countries/show'



  get 'contactos/update_sucursales', as: 'update_sucursales'
  get 'contactos/show'

  get 'sucursals/update_contactos', as: 'update_contactos'
  get 'sucursals/show'

  get 'direccions/update_sucursales', as: 'update_sucursales2'
  get 'horarios/update_sucursales', as: 'update_sucursales3'
  get 'datosgenerales/update_contactos', as: 'update_contactos2'

  resources :cities

  resources :countries

  resources :mensaje_configuracions

  resources :captures

  resources :pruebas

  resources :horarios

  resources :datosgenerales

  resources :direccions

  resources :sucursals

  resources :contactos

  resources :clientes



  # You can have the root of your site routed with "root"
  # root to: 'dashboards#dashboard_1'
  root :to => 'home#index'

  # All routes
  get "dashboards/dashboard_1"
  get "dashboards/dashboard_2"
  get "dashboards/dashboard_3"
  get "dashboards/dashboard_4"
  get "dashboards/dashboard_4_1"

  get "layoutsoptions/index"
  get "layoutsoptions/off_canvas"

  get "graphs/flot"
  get "graphs/morris"
  get "graphs/rickshaw"
  get "graphs/chartjs"
  get "graphs/chartist"
  get "graphs/peity"
  get "graphs/sparkline"

  get "mailbox/inbox"
  get "mailbox/email_view"
  get "mailbox/compose_email"
  get "mailbox/email_templates"
  get "mailbox/basic_action_email"
  get "mailbox/alert_email"
  get "mailbox/billing_email"

  get "metrics/index"

  get "widgets/index"

  get "forms/basic_forms"
  get "forms/advanced"
  get "forms/wizard"
  get "forms/file_upload"
  get "forms/text_editor"

  get "appviews/contacts"
  get "appviews/profile"
  get "appviews/projects"
  get "appviews/project_detail"
  get "appviews/file_menager"
  get "appviews/calendar"
  get "appviews/faq"
  get "appviews/timeline"
  get "appviews/pin_board"
  get "appviews/teams_board"
  get "appviews/social_feed"
  get "appviews/clients"
  get "appviews/outlook_view"
  get "appviews/blog"
  get "appviews/article"
  get "appviews/issue_tracker"

  get "pages/search_results"
  get "pages/lockscreen"
  get "pages/invoice"
  get "pages/invoice_print"
  get "pages/login"
  get "pages/login_2"
  get "pages/forgot_password"
  get "pages/register"
  get "pages/not_found_error"
  get "pages/internal_server_error"
  get "pages/empty_page"

  get "miscellaneous/notification"
  get "miscellaneous/nestablelist"
  get "miscellaneous/timeline_second_version"
  get "miscellaneous/forum_view"
  get "miscellaneous/forum_post_view"
  get "miscellaneous/google_maps"
  get "miscellaneous/code_editor"
  get "miscellaneous/modal_window"
  get "miscellaneous/validation"
  get "miscellaneous/tree_view"
  get "miscellaneous/chat_view"
  get "miscellaneous/agile_board"
  get "miscellaneous/diff"
  get "miscellaneous/sweet_alert"
  get "miscellaneous/idle_timer"
  get "miscellaneous/spinners"
  get "miscellaneous/live_favicon"

  get "uielements/typography"
  get "uielements/icons"
  get "uielements/draggable_panels"
  get "uielements/buttons"
  get "uielements/video"
  get "uielements/tables_panels"
  get "uielements/tabs"
  get "uielements/notifications_tooltips"
  get "uielements/badges_labels_progress"

  get "gridoptions/index"

  get "tables/static_tables"
  get "tables/data_tables"
  get "tables/foo_tables"
  get "tables/jqgrid"

  get "commerce/products_grid"
  get "commerce/products_list"
  get "commerce/product_edit"
  get "commerce/orders"

  get "gallery/basic_gallery"
  get "gallery/bootstrap_carusela"

  get "cssanimations/index"

  get "landing/index"
  get "home/index"

end
