# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170503214147) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agenda_accounts", force: :cascade do |t|
    t.integer  "agenda_id"
    t.integer  "datosgenerale_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "agenda_accounts", ["agenda_id"], name: "index_agenda_accounts_on_agenda_id", using: :btree
  add_index "agenda_accounts", ["datosgenerale_id"], name: "index_agenda_accounts_on_datosgenerale_id", using: :btree

  create_table "agendas", force: :cascade do |t|
    t.integer  "cliente_id"
    t.string   "nombre",     limit: 255
    t.string   "rfc",        limit: 255
    t.string   "calle",      limit: 255
    t.string   "numero",     limit: 255
    t.string   "colonia",    limit: 255
    t.string   "delegacion", limit: 255
    t.string   "estado",     limit: 255
    t.string   "cp",         limit: 255
    t.string   "email",      limit: 255
    t.string   "telefono",   limit: 255
    t.string   "cel",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "asks", force: :cascade do |t|
    t.integer  "cliente_id"
    t.integer  "usuario_id"
    t.text     "question"
    t.string   "asked_by",         limit: 255
    t.text     "answer"
    t.string   "answer_by",        limit: 255
    t.date     "answer_date"
    t.integer  "voting"
    t.string   "subject",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "datosgenerale_id"
  end

  add_index "asks", ["cliente_id"], name: "index_asks_on_cliente_id", using: :btree
  add_index "asks", ["datosgenerale_id"], name: "index_asks_on_datosgenerale_id", using: :btree
  add_index "asks", ["usuario_id"], name: "index_asks_on_usuario_id", using: :btree

  create_table "calls", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.integer  "information_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "calls", ["information_id"], name: "index_calls_on_information_id", using: :btree

  create_table "captures", force: :cascade do |t|
    t.boolean  "fecha"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ticket",                   limit: 255
    t.string   "compania",                 limit: 255
    t.string   "polizaContrato",           limit: 255
    t.string   "descripcionEmergencia",    limit: 255
    t.string   "identificarSistema",       limit: 255
    t.string   "referencia",               limit: 255
    t.string   "comentariosExtra",         limit: 255
    t.string   "avisoNombre",              limit: 255
    t.string   "notificoNombre",           limit: 255
    t.string   "rllsOperador",             limit: 255
    t.string   "notificacionLlegadaSitio", limit: 255
    t.string   "rteOperador",              limit: 255
    t.string   "situacionEmergencia",      limit: 255
    t.string   "duracionEmeregencia"
    t.string   "faltaSuministroGas",       limit: 255
    t.string   "tipoLlamada",              limit: 255
    t.string   "codigo",                   limit: 255
    t.time     "horaEnlace"
    t.string   "medioSeEntero",            limit: 255
    t.string   "razaMascota",              limit: 255
    t.string   "edad"
    t.integer  "codigoAcceso"
    t.integer  "codigoOrganizador"
    t.integer  "telefonoOrigen"
    t.string   "paisOrigino",              limit: 255
    t.string   "localidadOrigino",         limit: 255
    t.string   "motivoDenuncia",           limit: 255
    t.string   "puestoInvolucrado",        limit: 255
    t.string   "resultadoEstatus",         limit: 255
    t.string   "emailContacto",            limit: 255
    t.string   "marca",                    limit: 255
    t.string   "modelo",                   limit: 255
    t.string   "serie",                    limit: 255
    t.string   "beneficiario",             limit: 255
    t.string   "contactoBeneficiario",     limit: 255
    t.string   "nombreFiado",              limit: 255
    t.string   "puestoFiado",              limit: 255
    t.decimal  "montoReportar",                        precision: 7, scale: 2
    t.integer  "intentosEnlace"
    t.string   "duracionLlamada"
    t.string   "origenCodigoGami",         limit: 255
    t.string   "codigoGami",               limit: 255
    t.string   "tipoEmergencia",           limit: 255
    t.string   "empresaCodigoGami",        limit: 255
    t.string   "nomenclaturaSistema",      limit: 255
    t.string   "personaRecibe",            limit: 255
    t.string   "razonSocial",              limit: 255
    t.string   "rfc",                      limit: 255
    t.string   "ticketCliente",            limit: 255
    t.string   "relacionPaciente",         limit: 255
    t.string   "lugarTumor",               limit: 255
    t.string   "institucionAtiende",       limit: 255
    t.string   "medicoTratante",           limit: 255
    t.string   "programaInteres",          limit: 255
    t.string   "club",                     limit: 255
    t.string   "handicap",                 limit: 255
    t.string   "redConecta",               limit: 255
    t.string   "intensidadSenal",          limit: 255
    t.string   "ubicacionFisica",          limit: 255
    t.string   "ipv4",                     limit: 255
    t.string   "macAddress",               limit: 255
    t.string   "hotel",                    limit: 255
    t.string   "habitacion",               limit: 255
    t.string   "usuario",                  limit: 255
    t.string   "contrasena",               limit: 255
    t.string   "tiempoContrato"
    t.string   "dispositivo",              limit: 255
    t.date     "fechaCirugia"
    t.string   "hospital",                 limit: 255
    t.string   "especidalidad",            limit: 255
    t.string   "paciente",                 limit: 255
    t.string   "cargoPersona",             limit: 255
    t.string   "telefonoMedico",           limit: 255
    t.string   "equipoEspecial",           limit: 255
    t.string   "telefonoPaciente",         limit: 255
    t.string   "procedimiento",            limit: 255
    t.date     "fechaProcedimiento"
    t.string   "fianza",                   limit: 255
    t.string   "inclusion",                limit: 255
    t.string   "codigoSeguridad",          limit: 255
    t.string   "numeroControl",            limit: 255
    t.string   "lineaValidacion",          limit: 255
    t.string   "tipoPoliza",               limit: 255
    t.string   "telefonoFiado",            limit: 255
    t.string   "direccionFiado",           limit: 255
    t.string   "lugarFianza",              limit: 255
    t.string   "vendedorFianza",           limit: 255
    t.string   "formaPagoFianza",          limit: 255
    t.string   "audioconferenciaReporta",  limit: 255
    t.integer  "sucursal_id"
    t.integer  "cliente_id"
    t.integer  "usuario_id"
    t.date     "avisoFecha"
    t.time     "avisoHora"
    t.date     "notificoFecha"
    t.time     "notificoHora"
    t.date     "rllsFecha"
    t.time     "rllsHora"
    t.date     "rteFecha"
    t.time     "rteHora"
    t.date     "terminoChatFecha"
    t.time     "terminoChatHora"
    t.string   "delito",                   limit: 255
    t.string   "cirugia",                  limit: 255
    t.boolean  "fijoMovil"
    t.boolean  "enlazadaCorrectamente"
    t.boolean  "acuse"
    t.boolean  "equipoDetenido"
    t.string   "tiempoRespuesta"
    t.string   "status",                   limit: 255
  end

  add_index "captures", ["cliente_id"], name: "index_captures_on_cliente_id", using: :btree
  add_index "captures", ["sucursal_id"], name: "index_captures_on_sucursal_id", using: :btree
  add_index "captures", ["usuario_id"], name: "index_captures_on_usuario_id", using: :btree

  create_table "checkins", force: :cascade do |t|
    t.integer  "usuario_id"
    t.datetime "checkin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "kind",       limit: 255
  end

  add_index "checkins", ["usuario_id"], name: "index_checkins_on_usuario_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["country_id"], name: "index_cities_on_country_id", using: :btree

  create_table "clientes", force: :cascade do |t|
    t.string   "nombre",                limit: 255
    t.string   "rfc",                   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "direccion_id"
    t.integer  "formapago_id"
    t.string   "nombreComercial",       limit: 255
    t.datetime "tipocambio_updated_at"
    t.decimal  "tipoCambio",                        precision: 6, scale: 4
  end

  create_table "contact_accounts", force: :cascade do |t|
    t.integer  "contacto_id"
    t.integer  "datosgenerale_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_clients", force: :cascade do |t|
    t.integer  "contacto_id"
    t.integer  "cliente_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "contact_clients", ["cliente_id"], name: "index_contact_clients_on_cliente_id", using: :btree
  add_index "contact_clients", ["contacto_id"], name: "index_contact_clients_on_contacto_id", using: :btree

  create_table "contactos", force: :cascade do |t|
    t.integer  "cliente_id"
    t.string   "nombre",      limit: 255
    t.string   "telefono",    limit: 255
    t.string   "ext",         limit: 255
    t.string   "cel",         limit: 255
    t.string   "email",       limit: 255
    t.string   "puesto",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sucursal_id"
    t.string   "skype",       limit: 255
    t.string   "funciones",   limit: 255
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "datosgenerales", force: :cascade do |t|
    t.date     "alta"
    t.string   "clavesalida",   limit: 255
    t.string   "locacion",      limit: 255
    t.string   "did",           limit: 255
    t.string   "telenrutados",  limit: 255
    t.integer  "contacto1_id"
    t.integer  "contacto2_id"
    t.integer  "contacto3_id"
    t.integer  "contacto4_id"
    t.integer  "contacto5_id"
    t.string   "telefono1",     limit: 255
    t.string   "telefono2",     limit: 255
    t.string   "telefono3",     limit: 255
    t.string   "telefono4",     limit: 255
    t.string   "telefono5",     limit: 255
    t.string   "fax",           limit: 255
    t.string   "giro",          limit: 255
    t.string   "procedimiento", limit: 255
    t.string   "paginaweb",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cliente_id"
    t.integer  "horario_id"
    t.boolean  "tipocambio"
    t.boolean  "pedido"
    t.string   "frase",         limit: 255
    t.string   "recipient",     limit: 255
    t.string   "periodicity",   limit: 255
    t.date     "start"
    t.string   "account",       limit: 255
  end

  create_table "detail_reports", force: :cascade do |t|
    t.integer  "report_id"
    t.integer  "field_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "detail_reports", ["field_id"], name: "index_detail_reports_on_field_id", using: :btree
  add_index "detail_reports", ["report_id"], name: "index_detail_reports_on_report_id", using: :btree

  create_table "direccions", force: :cascade do |t|
    t.integer  "sucursal_id"
    t.string   "calle",              limit: 255
    t.string   "numero",             limit: 255
    t.string   "colonia",            limit: 255
    t.string   "delegacion",         limit: 255
    t.string   "cp",                 limit: 255
    t.string   "telefono",           limit: 255
    t.string   "referencia",         limit: 255
    t.string   "mapsgoogle",         limit: 255
    t.boolean  "matriz"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "cliente_id"
  end

  create_table "events", force: :cascade do |t|
    t.string   "event",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fields", force: :cascade do |t|
    t.integer  "form_id"
    t.string   "name",         limit: 255
    t.boolean  "mandatory"
    t.boolean  "show_in_list"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "data_type",    limit: 255
    t.string   "behave",       limit: 255, default: "Comun"
    t.string   "list",         limit: 255
    t.integer  "position"
  end

  create_table "form10s", force: :cascade do |t|
    t.integer  "cliente_id"
    t.integer  "usuario_id"
    t.string   "field1",     limit: 255
    t.string   "field2",     limit: 255
    t.string   "field3",     limit: 255
    t.string   "field4",     limit: 255
    t.string   "field5",     limit: 255
    t.string   "field6",     limit: 255
    t.string   "field7",     limit: 255
    t.string   "field8",     limit: 255
    t.string   "field9",     limit: 255
    t.string   "field10",    limit: 255
    t.string   "field11",    limit: 255
    t.string   "field12",    limit: 255
    t.string   "field13",    limit: 255
    t.string   "field14",    limit: 255
    t.string   "field15",    limit: 255
    t.string   "field16",    limit: 255
    t.string   "field17",    limit: 255
    t.string   "field18",    limit: 255
    t.string   "field19",    limit: 255
    t.string   "field20",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "form1s", force: :cascade do |t|
    t.integer  "cliente_id"
    t.integer  "usuario_id"
    t.string   "field1",     limit: 255
    t.string   "field2",     limit: 255
    t.string   "field3",     limit: 255
    t.string   "field4",     limit: 255
    t.string   "field5",     limit: 255
    t.string   "field6",     limit: 255
    t.string   "field7",     limit: 255
    t.string   "field8",     limit: 255
    t.string   "field9",     limit: 255
    t.string   "field10",    limit: 255
    t.string   "field11",    limit: 255
    t.string   "field12",    limit: 255
    t.string   "field13",    limit: 255
    t.string   "field15",    limit: 255
    t.string   "field16",    limit: 255
    t.string   "field17",    limit: 255
    t.string   "field18",    limit: 255
    t.string   "field19",    limit: 255
    t.string   "field20",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "field14",    limit: 255
  end

  create_table "form2s", force: :cascade do |t|
    t.integer  "cliente_id"
    t.integer  "usuario_id"
    t.string   "field1",     limit: 255
    t.string   "field2",     limit: 255
    t.string   "field3",     limit: 255
    t.string   "field4",     limit: 255
    t.string   "field5",     limit: 255
    t.string   "field6",     limit: 255
    t.string   "field7",     limit: 255
    t.string   "field8",     limit: 255
    t.string   "field9",     limit: 255
    t.string   "field10",    limit: 255
    t.string   "field11",    limit: 255
    t.string   "field12",    limit: 255
    t.string   "field13",    limit: 255
    t.string   "field15",    limit: 255
    t.string   "field16",    limit: 255
    t.string   "field17",    limit: 255
    t.string   "field18",    limit: 255
    t.string   "field19",    limit: 255
    t.string   "field20",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "field14",    limit: 255
  end

  create_table "form3s", force: :cascade do |t|
    t.integer  "cliente_id"
    t.integer  "usuario_id"
    t.string   "field1",     limit: 255
    t.string   "field2",     limit: 255
    t.string   "field3",     limit: 255
    t.string   "field4",     limit: 255
    t.string   "field5",     limit: 255
    t.string   "field6",     limit: 255
    t.string   "field7",     limit: 255
    t.string   "field8",     limit: 255
    t.string   "field9",     limit: 255
    t.string   "field10",    limit: 255
    t.string   "field11",    limit: 255
    t.string   "field12",    limit: 255
    t.string   "field13",    limit: 255
    t.string   "field15",    limit: 255
    t.string   "field16",    limit: 255
    t.string   "field17",    limit: 255
    t.string   "field18",    limit: 255
    t.string   "field19",    limit: 255
    t.string   "field20",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "field14",    limit: 255
  end

  create_table "form4s", force: :cascade do |t|
    t.integer  "cliente_id"
    t.integer  "usuario_id"
    t.string   "field1",     limit: 255
    t.string   "field2",     limit: 255
    t.string   "field3",     limit: 255
    t.string   "field4",     limit: 255
    t.string   "field5",     limit: 255
    t.string   "field6",     limit: 255
    t.string   "field7",     limit: 255
    t.string   "field8",     limit: 255
    t.string   "field9",     limit: 255
    t.string   "field10",    limit: 255
    t.string   "field11",    limit: 255
    t.string   "field12",    limit: 255
    t.string   "field13",    limit: 255
    t.string   "field14",    limit: 255
    t.string   "field15",    limit: 255
    t.string   "field16",    limit: 255
    t.string   "field17",    limit: 255
    t.string   "field18",    limit: 255
    t.string   "field19",    limit: 255
    t.string   "field20",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "form5s", force: :cascade do |t|
    t.integer  "cliente_id"
    t.integer  "usuario_id"
    t.string   "field1",     limit: 255
    t.string   "field2",     limit: 255
    t.string   "field3",     limit: 255
    t.string   "field4",     limit: 255
    t.string   "field5",     limit: 255
    t.string   "field6",     limit: 255
    t.string   "field7",     limit: 255
    t.string   "field8",     limit: 255
    t.string   "field9",     limit: 255
    t.string   "field10",    limit: 255
    t.string   "field11",    limit: 255
    t.string   "field12",    limit: 255
    t.string   "field13",    limit: 255
    t.string   "field14",    limit: 255
    t.string   "field15",    limit: 255
    t.string   "field16",    limit: 255
    t.string   "field17",    limit: 255
    t.string   "field18",    limit: 255
    t.string   "field19",    limit: 255
    t.string   "field20",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "form6s", force: :cascade do |t|
    t.integer  "cliente_id"
    t.integer  "usuario_id"
    t.string   "field1",     limit: 255
    t.string   "field2",     limit: 255
    t.string   "field3",     limit: 255
    t.string   "field4",     limit: 255
    t.string   "field5",     limit: 255
    t.string   "field6",     limit: 255
    t.string   "field7",     limit: 255
    t.string   "field8",     limit: 255
    t.string   "field9",     limit: 255
    t.string   "field10",    limit: 255
    t.string   "field11",    limit: 255
    t.string   "field12",    limit: 255
    t.string   "field13",    limit: 255
    t.string   "field14",    limit: 255
    t.string   "field15",    limit: 255
    t.string   "field16",    limit: 255
    t.string   "field17",    limit: 255
    t.string   "field18",    limit: 255
    t.string   "field19",    limit: 255
    t.string   "field20",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "form7s", force: :cascade do |t|
    t.integer  "cliente_id"
    t.integer  "usuario_id"
    t.string   "field1",     limit: 255
    t.string   "field2",     limit: 255
    t.string   "field3",     limit: 255
    t.string   "field4",     limit: 255
    t.string   "field5",     limit: 255
    t.string   "field6",     limit: 255
    t.string   "field7",     limit: 255
    t.string   "field8",     limit: 255
    t.string   "field9",     limit: 255
    t.string   "field10",    limit: 255
    t.string   "field11",    limit: 255
    t.string   "field12",    limit: 255
    t.string   "field13",    limit: 255
    t.string   "field14",    limit: 255
    t.string   "field15",    limit: 255
    t.string   "field16",    limit: 255
    t.string   "field17",    limit: 255
    t.string   "field18",    limit: 255
    t.string   "field19",    limit: 255
    t.string   "field20",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "form8s", force: :cascade do |t|
    t.integer  "cliente_id"
    t.integer  "usuario_id"
    t.string   "field1",     limit: 255
    t.string   "field2",     limit: 255
    t.string   "field3",     limit: 255
    t.string   "field4",     limit: 255
    t.string   "field5",     limit: 255
    t.string   "field6",     limit: 255
    t.string   "field7",     limit: 255
    t.string   "field8",     limit: 255
    t.string   "field9",     limit: 255
    t.string   "field10",    limit: 255
    t.string   "field11",    limit: 255
    t.string   "field12",    limit: 255
    t.string   "field13",    limit: 255
    t.string   "field14",    limit: 255
    t.string   "field15",    limit: 255
    t.string   "field16",    limit: 255
    t.string   "field17",    limit: 255
    t.string   "field18",    limit: 255
    t.string   "field19",    limit: 255
    t.string   "field20",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "form9s", force: :cascade do |t|
    t.integer  "cliente_id"
    t.integer  "usuario_id"
    t.string   "field1",     limit: 255
    t.string   "field2",     limit: 255
    t.string   "field3",     limit: 255
    t.string   "field4",     limit: 255
    t.string   "field5",     limit: 255
    t.string   "field6",     limit: 255
    t.string   "field7",     limit: 255
    t.string   "field8",     limit: 255
    t.string   "field9",     limit: 255
    t.string   "field10",    limit: 255
    t.string   "field11",    limit: 255
    t.string   "field12",    limit: 255
    t.string   "field13",    limit: 255
    t.string   "field14",    limit: 255
    t.string   "field15",    limit: 255
    t.string   "field16",    limit: 255
    t.string   "field17",    limit: 255
    t.string   "field18",    limit: 255
    t.string   "field19",    limit: 255
    t.string   "field20",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formapagos", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forms", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "cliente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "procedure_id"
  end

  add_index "forms", ["procedure_id"], name: "index_forms_on_procedure_id", using: :btree

  create_table "horarios", force: :cascade do |t|
    t.string   "nombre",      limit: 255
    t.time     "lunhini"
    t.time     "lunhfin"
    t.time     "marhini"
    t.time     "marhfin"
    t.time     "miehini"
    t.time     "miehfin"
    t.time     "juehini"
    t.time     "juehfin"
    t.time     "viehini"
    t.time     "viehfin"
    t.time     "sabhini"
    t.time     "sabhfin"
    t.time     "domhini"
    t.time     "domhfin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cliente_id"
    t.integer  "sucursal_id"
  end

  create_table "information", force: :cascade do |t|
    t.integer  "form_id"
    t.integer  "usuario_id"
    t.text     "field1"
    t.text     "field2"
    t.text     "field3"
    t.text     "field4"
    t.text     "field5"
    t.text     "field6"
    t.text     "field7"
    t.text     "field8"
    t.text     "field9"
    t.text     "field10"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "field12"
    t.text     "field13"
    t.text     "field14"
    t.text     "field15"
    t.text     "field16"
    t.text     "field17"
    t.text     "field18"
    t.text     "field19"
    t.text     "field20"
    t.text     "field11"
    t.integer  "datosgenerale_id"
    t.datetime "start_call"
    t.datetime "end_call"
    t.integer  "userupdate_id"
  end

  add_index "information", ["datosgenerale_id"], name: "index_information_on_datosgenerale_id", using: :btree
  add_index "information", ["form_id"], name: "index_information_on_form_id", using: :btree
  add_index "information", ["usuario_id"], name: "index_information_on_usuario_id", using: :btree

  create_table "logs", force: :cascade do |t|
    t.integer  "usuario_id"
    t.string   "action",     limit: 255
    t.string   "detail",     limit: 255
    t.string   "field",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "logs", ["usuario_id"], name: "index_logs_on_usuario_id", using: :btree

  create_table "mensaje_configuracions", force: :cascade do |t|
    t.string   "ticket",                   limit: 255
    t.string   "compania",                 limit: 255
    t.string   "polizaContrato",           limit: 255
    t.string   "descripcionEmergencia",    limit: 255
    t.string   "identificarSistema",       limit: 255
    t.string   "referencia",               limit: 255
    t.string   "comentariosExtra",         limit: 255
    t.string   "avisoNombre",              limit: 255
    t.string   "avisoFecha",               limit: 255
    t.string   "notificoNombre",           limit: 255
    t.string   "notificoFechaHora",        limit: 255
    t.string   "rllsOperador",             limit: 255
    t.string   "rllsFechaHora",            limit: 255
    t.string   "tiempoRespuesta",          limit: 255
    t.string   "notificacionLlegadaSitio", limit: 255
    t.string   "rteOperador",              limit: 255
    t.string   "rteFechaHora",             limit: 255
    t.string   "situacionEmergencia",      limit: 255
    t.string   "duracionEmeregencia",      limit: 255
    t.string   "faltaSuministroGas",       limit: 255
    t.string   "sucursal",                 limit: 255
    t.string   "tipoLlamada",              limit: 255
    t.string   "codigo",                   limit: 255
    t.string   "horaEnlace",               limit: 255
    t.string   "medioSeEntero",            limit: 255
    t.string   "terminoChat",              limit: 255
    t.string   "razaMascota",              limit: 255
    t.string   "edad",                     limit: 255
    t.string   "codigoAcceso",             limit: 255
    t.string   "codigoOrganizador",        limit: 255
    t.string   "fijoMovil",                limit: 255
    t.string   "telefonoOrigen",           limit: 255
    t.string   "paisOrigino",              limit: 255
    t.string   "localidadOrigino",         limit: 255
    t.string   "motivoDenuncia",           limit: 255
    t.string   "tipoDelito",               limit: 255
    t.string   "puestoInvolucrado",        limit: 255
    t.string   "resultadoEstatus",         limit: 255
    t.string   "emailContacto",            limit: 255
    t.string   "marca",                    limit: 255
    t.string   "modelo",                   limit: 255
    t.string   "serie",                    limit: 255
    t.string   "beneficiario",             limit: 255
    t.string   "contactoBeneficiario",     limit: 255
    t.string   "nombreFiado",              limit: 255
    t.string   "puestoFiado",              limit: 255
    t.string   "montoReportar",            limit: 255
    t.string   "enlazadaCorrectamente",    limit: 255
    t.string   "intentosEnlace",           limit: 255
    t.string   "duracionLlamada",          limit: 255
    t.string   "origenCodigoGami",         limit: 255
    t.string   "codigoGami",               limit: 255
    t.string   "tipoEmergencia",           limit: 255
    t.string   "empresaCodigoGami",        limit: 255
    t.string   "nomenclaturaSistema",      limit: 255
    t.string   "personaRecibe",            limit: 255
    t.string   "razonSocial",              limit: 255
    t.string   "rfc",                      limit: 255
    t.string   "ticketCliente",            limit: 255
    t.string   "relacionPaciente",         limit: 255
    t.string   "lugarTumor",               limit: 255
    t.string   "institucionAtiende",       limit: 255
    t.string   "medicoTratante",           limit: 255
    t.string   "programaInteres",          limit: 255
    t.string   "club",                     limit: 255
    t.string   "handicap",                 limit: 255
    t.string   "redConecta",               limit: 255
    t.string   "intensidadSenal",          limit: 255
    t.string   "ubicacionFisica",          limit: 255
    t.string   "ipv4",                     limit: 255
    t.string   "macAddress",               limit: 255
    t.string   "hotel",                    limit: 255
    t.string   "habitacion",               limit: 255
    t.string   "usuario",                  limit: 255
    t.string   "contrasena",               limit: 255
    t.string   "tiempoContrato",           limit: 255
    t.string   "dispositivo",              limit: 255
    t.string   "acuse",                    limit: 255
    t.string   "fechaCirugia",             limit: 255
    t.string   "hospital",                 limit: 255
    t.string   "tipoCirugia",              limit: 255
    t.string   "especidalidad",            limit: 255
    t.string   "paciente",                 limit: 255
    t.string   "cargoPersona",             limit: 255
    t.string   "telefonoMedico",           limit: 255
    t.string   "equipoEspecial",           limit: 255
    t.string   "telefonoPaciente",         limit: 255
    t.string   "procedimiento",            limit: 255
    t.string   "fechaProcedimiento",       limit: 255
    t.string   "equipoDetenido",           limit: 255
    t.string   "fianza",                   limit: 255
    t.string   "inclusion",                limit: 255
    t.string   "codigoSeguridad",          limit: 255
    t.string   "numeroControl",            limit: 255
    t.string   "lineaValidacion",          limit: 255
    t.string   "tipoPoliza",               limit: 255
    t.string   "telefonoFiado",            limit: 255
    t.string   "direccionFiado",           limit: 255
    t.string   "lugarFianza",              limit: 255
    t.string   "vendedorFianza",           limit: 255
    t.string   "formaPagoFianza",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cliente_id"
    t.string   "audioconferenciaReporta",  limit: 255
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "cliente_id"
    t.integer  "sucursal_id"
    t.integer  "usuario_id"
    t.integer  "status_id"
    t.integer  "event_id"
    t.string   "notification",     limit: 255
    t.date     "startdate"
    t.time     "starttime"
    t.date     "duedate"
    t.time     "duetime"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "person_id"
    t.integer  "recipient_id"
    t.datetime "startdatetime"
    t.datetime "duedatetime"
    t.integer  "datosgenerale_id"
  end

  add_index "notifications", ["cliente_id"], name: "index_notifications_on_cliente_id", using: :btree
  add_index "notifications", ["datosgenerale_id"], name: "index_notifications_on_datosgenerale_id", using: :btree
  add_index "notifications", ["event_id"], name: "index_notifications_on_event_id", using: :btree
  add_index "notifications", ["person_id"], name: "index_notifications_on_person_id", using: :btree
  add_index "notifications", ["recipient_id"], name: "index_notifications_on_recipient_id", using: :btree
  add_index "notifications", ["status_id"], name: "index_notifications_on_status_id", using: :btree
  add_index "notifications", ["sucursal_id"], name: "index_notifications_on_sucursal_id", using: :btree
  add_index "notifications", ["usuario_id"], name: "index_notifications_on_usuario_id", using: :btree

  create_table "order_details", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "quatity"
    t.integer  "product_id"
    t.decimal  "price",      precision: 8, scale: 2
    t.decimal  "total",      precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "agenda_id"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "breed",      limit: 255
    t.integer  "age"
  end

  create_table "procedure_accounts", force: :cascade do |t|
    t.integer  "procedure_id"
    t.integer  "datosgenerale_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "procedure_accounts", ["datosgenerale_id"], name: "index_procedure_accounts_on_datosgenerale_id", using: :btree
  add_index "procedure_accounts", ["procedure_id"], name: "index_procedure_accounts_on_procedure_id", using: :btree

  create_table "procedures", force: :cascade do |t|
    t.integer  "cliente_id"
    t.integer  "sucursal_id"
    t.string   "name",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number"
    t.boolean  "deliver",                      default: false
    t.integer  "datosgenerale_id"
  end

  add_index "procedures", ["datosgenerale_id"], name: "index_procedures_on_datosgenerale_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.integer  "cliente_id"
    t.string   "description",           limit: 255
    t.decimal  "price",                             precision: 6, scale: 2
    t.decimal  "price_by_kg",                       precision: 6, scale: 2
    t.string   "usability",             limit: 255
    t.string   "category",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "magnitude",                         precision: 6, scale: 2
    t.string   "measure",               limit: 255
    t.string   "magnitude_description", limit: 255
    t.string   "code",                  limit: 255
    t.string   "presentation",          limit: 255
    t.string   "brand",                 limit: 255
  end

  create_table "pruebas", force: :cascade do |t|
    t.string   "clave",      limit: 255
    t.string   "nombre",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "report_accounts", force: :cascade do |t|
    t.integer  "report_id"
    t.integer  "datosgenerale_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "report_accounts", ["datosgenerale_id"], name: "index_report_accounts_on_datosgenerale_id", using: :btree
  add_index "report_accounts", ["report_id"], name: "index_report_accounts_on_report_id", using: :btree

  create_table "report_recipients", force: :cascade do |t|
    t.integer  "report_id"
    t.integer  "contacto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "report_recipients", ["contacto_id"], name: "index_report_recipients_on_contacto_id", using: :btree
  add_index "report_recipients", ["report_id"], name: "index_report_recipients_on_report_id", using: :btree

  create_table "report_sents", force: :cascade do |t|
    t.integer  "report_id"
    t.string   "sent_by",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "sent_to"
  end

  add_index "report_sents", ["report_id"], name: "index_report_sents_on_report_id", using: :btree

  create_table "reports", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "cliente_id"
    t.string   "periodicity",   limit: 255
    t.string   "schedule",      limit: 255
    t.integer  "form_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_day"
    t.datetime "end_day"
    t.time     "start_time"
    t.time     "end_time"
    t.boolean  "send_same_day"
    t.boolean  "active"
    t.boolean  "temp"
  end

  add_index "reports", ["cliente_id"], name: "index_reports_on_cliente_id", using: :btree
  add_index "reports", ["form_id"], name: "index_reports_on_form_id", using: :btree

  create_table "scalings", force: :cascade do |t|
    t.integer  "datosgenerale_id"
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "image1_file_name"
    t.string   "image1_content_type"
    t.integer  "image1_file_size"
    t.datetime "image1_updated_at"
    t.integer  "cliente_id"
    t.string   "image2_file_name"
    t.string   "image2_content_type"
    t.integer  "image2_file_size"
    t.datetime "image2_updated_at"
    t.string   "image3_file_name"
    t.string   "image3_content_type"
    t.integer  "image3_file_size"
    t.datetime "image3_updated_at"
  end

  add_index "scalings", ["cliente_id"], name: "index_scalings_on_cliente_id", using: :btree
  add_index "scalings", ["datosgenerale_id"], name: "index_scalings_on_datosgenerale_id", using: :btree

  create_table "sents", force: :cascade do |t|
    t.integer  "usuario_id"
    t.integer  "information_id"
    t.string   "recipient",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "kind",           limit: 255
  end

  add_index "sents", ["information_id"], name: "index_sents_on_information_id", using: :btree
  add_index "sents", ["usuario_id"], name: "index_sents_on_usuario_id", using: :btree

  create_table "statuses", force: :cascade do |t|
    t.string   "status",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "steps", force: :cascade do |t|
    t.integer  "procedure_id"
    t.string   "name",         limit: 255
    t.text     "detail"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "required"
    t.boolean  "form"
  end

  add_index "steps", ["procedure_id"], name: "index_steps_on_procedure_id", using: :btree

  create_table "sucursals", force: :cascade do |t|
    t.integer  "cliente_id"
    t.string   "nombre",           limit: 255
    t.string   "telefono",         limit: 255
    t.integer  "contacto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "recepcionista_id"
    t.integer  "main_id"
    t.integer  "secondary_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",   null: false
    t.string   "encrypted_password",     limit: 255, default: "",   null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.boolean  "activo",                             default: true
    t.string   "role",                   limit: 255
    t.integer  "contacto_id"
  end

  add_index "usuarios", ["contacto_id"], name: "index_usuarios_on_contacto_id", using: :btree
  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "contact_clients", "clientes"
  add_foreign_key "contact_clients", "contactos"
  add_foreign_key "scalings", "clientes"
  add_foreign_key "scalings", "datosgenerales"
end
