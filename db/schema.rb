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

ActiveRecord::Schema.define(version: 20151124205713) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agendas", force: true do |t|
    t.integer  "cliente_id"
    t.string   "nombre"
    t.string   "rfc"
    t.string   "calle"
    t.string   "numero"
    t.string   "colonia"
    t.string   "delegacion"
    t.string   "estado"
    t.string   "cp"
    t.string   "email"
    t.string   "telefono"
    t.string   "cel"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "captures", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ticket"
    t.string   "compania"
    t.string   "polizaContrato"
    t.string   "descripcionEmergencia"
    t.string   "identificarSistema"
    t.string   "referencia"
    t.string   "comentariosExtra"
    t.string   "avisoNombre"
    t.string   "notificoNombre"
    t.string   "rllsOperador"
    t.string   "notificacionLlegadaSitio"
    t.string   "rteOperador"
    t.string   "situacionEmergencia"
    t.string   "duracionEmeregencia",      limit: nil
    t.string   "faltaSuministroGas"
    t.string   "tipoLlamada"
    t.string   "codigo"
    t.time     "horaEnlace"
    t.string   "medioSeEntero"
    t.string   "razaMascota"
    t.string   "edad",                     limit: nil
    t.integer  "codigoAcceso"
    t.integer  "codigoOrganizador"
    t.integer  "telefonoOrigen"
    t.string   "paisOrigino"
    t.string   "localidadOrigino"
    t.string   "motivoDenuncia"
    t.string   "puestoInvolucrado"
    t.string   "resultadoEstatus"
    t.string   "emailContacto"
    t.string   "marca"
    t.string   "modelo"
    t.string   "serie"
    t.string   "beneficiario"
    t.string   "contactoBeneficiario"
    t.string   "nombreFiado"
    t.string   "puestoFiado"
    t.decimal  "montoReportar",                        precision: 7, scale: 2
    t.integer  "intentosEnlace"
    t.string   "duracionLlamada",          limit: nil
    t.string   "origenCodigoGami"
    t.string   "codigoGami"
    t.string   "tipoEmergencia"
    t.string   "empresaCodigoGami"
    t.string   "nomenclaturaSistema"
    t.string   "personaRecibe"
    t.string   "razonSocial"
    t.string   "rfc"
    t.string   "ticketCliente"
    t.string   "relacionPaciente"
    t.string   "lugarTumor"
    t.string   "institucionAtiende"
    t.string   "medicoTratante"
    t.string   "programaInteres"
    t.string   "club"
    t.string   "handicap"
    t.string   "redConecta"
    t.string   "intensidadSenal"
    t.string   "ubicacionFisica"
    t.string   "ipv4"
    t.string   "macAddress"
    t.string   "hotel"
    t.string   "habitacion"
    t.string   "usuario"
    t.string   "contrasena"
    t.string   "tiempoContrato",           limit: nil
    t.string   "dispositivo"
    t.date     "fechaCirugia"
    t.string   "hospital"
    t.string   "especidalidad"
    t.string   "paciente"
    t.string   "cargoPersona"
    t.string   "telefonoMedico"
    t.string   "equipoEspecial"
    t.string   "telefonoPaciente"
    t.string   "procedimiento"
    t.date     "fechaProcedimiento"
    t.string   "fianza"
    t.string   "inclusion"
    t.string   "codigoSeguridad"
    t.string   "numeroControl"
    t.string   "lineaValidacion"
    t.string   "tipoPoliza"
    t.string   "telefonoFiado"
    t.string   "direccionFiado"
    t.string   "lugarFianza"
    t.string   "vendedorFianza"
    t.string   "formaPagoFianza"
    t.string   "audioconferenciaReporta"
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
    t.string   "delito"
    t.string   "cirugia"
    t.boolean  "fijoMovil"
    t.boolean  "enlazadaCorrectamente"
    t.boolean  "acuse"
    t.boolean  "equipoDetenido"
    t.string   "tiempoRespuesta",          limit: nil
    t.string   "status"
  end

  add_index "captures", ["cliente_id"], name: "index_captures_on_cliente_id", using: :btree
  add_index "captures", ["sucursal_id"], name: "index_captures_on_sucursal_id", using: :btree
  add_index "captures", ["usuario_id"], name: "index_captures_on_usuario_id", using: :btree

  create_table "cities", force: true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["country_id"], name: "index_cities_on_country_id", using: :btree

  create_table "clientes", force: true do |t|
    t.string   "nombre"
    t.string   "rfc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "direccion_id"
    t.integer  "formapago_id"
    t.string   "nombreComercial"
    t.decimal  "tipoCambio",      precision: 4, scale: 2
  end

  create_table "contactos", force: true do |t|
    t.integer  "cliente_id"
    t.string   "nombre"
    t.string   "telefono"
    t.string   "ext"
    t.string   "cel"
    t.string   "email"
    t.string   "puesto"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sucursal_id"
    t.string   "skype"
    t.string   "funciones"
  end

  create_table "countries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "datosgenerales", force: true do |t|
    t.date     "alta"
    t.date     "actualizacion"
    t.string   "clavesalida"
    t.string   "locacion"
    t.string   "did"
    t.string   "telenrutados"
    t.integer  "contacto1_id"
    t.integer  "contacto2_id"
    t.integer  "contacto3_id"
    t.integer  "contacto4_id"
    t.integer  "contacto5_id"
    t.string   "telefono1"
    t.string   "telefono2"
    t.string   "telefono3"
    t.string   "telefono4"
    t.string   "telefono5"
    t.string   "fax"
    t.string   "giro"
    t.string   "procedimiento"
    t.string   "paginaweb"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cliente_id"
    t.integer  "horario_id"
    t.boolean  "tipocambio"
    t.boolean  "pedido"
    t.string   "frase"
  end

  create_table "direccions", force: true do |t|
    t.integer  "sucursal_id"
    t.string   "calle"
    t.string   "numero"
    t.string   "colonia"
    t.string   "delegacion"
    t.string   "cp"
    t.string   "telefono"
    t.string   "referencia"
    t.string   "mapsgoogle"
    t.boolean  "matriz"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "cliente_id"
  end

  create_table "events", force: true do |t|
    t.string   "event"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formapagos", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "horarios", force: true do |t|
    t.string   "nombre"
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

  create_table "mensaje_configuracions", force: true do |t|
    t.string   "ticket"
    t.string   "compania"
    t.string   "polizaContrato"
    t.string   "descripcionEmergencia"
    t.string   "identificarSistema"
    t.string   "referencia"
    t.string   "comentariosExtra"
    t.string   "avisoNombre"
    t.string   "avisoFecha"
    t.string   "notificoNombre"
    t.string   "notificoFechaHora"
    t.string   "rllsOperador"
    t.string   "rllsFechaHora"
    t.string   "tiempoRespuesta"
    t.string   "notificacionLlegadaSitio"
    t.string   "rteOperador"
    t.string   "rteFechaHora"
    t.string   "situacionEmergencia"
    t.string   "duracionEmeregencia"
    t.string   "faltaSuministroGas"
    t.string   "sucursal"
    t.string   "tipoLlamada"
    t.string   "codigo"
    t.string   "horaEnlace"
    t.string   "medioSeEntero"
    t.string   "terminoChat"
    t.string   "razaMascota"
    t.string   "edad"
    t.string   "codigoAcceso"
    t.string   "codigoOrganizador"
    t.string   "fijoMovil"
    t.string   "telefonoOrigen"
    t.string   "paisOrigino"
    t.string   "localidadOrigino"
    t.string   "motivoDenuncia"
    t.string   "tipoDelito"
    t.string   "puestoInvolucrado"
    t.string   "resultadoEstatus"
    t.string   "emailContacto"
    t.string   "marca"
    t.string   "modelo"
    t.string   "serie"
    t.string   "beneficiario"
    t.string   "contactoBeneficiario"
    t.string   "nombreFiado"
    t.string   "puestoFiado"
    t.string   "montoReportar"
    t.string   "enlazadaCorrectamente"
    t.string   "intentosEnlace"
    t.string   "duracionLlamada"
    t.string   "origenCodigoGami"
    t.string   "codigoGami"
    t.string   "tipoEmergencia"
    t.string   "empresaCodigoGami"
    t.string   "nomenclaturaSistema"
    t.string   "personaRecibe"
    t.string   "razonSocial"
    t.string   "rfc"
    t.string   "ticketCliente"
    t.string   "relacionPaciente"
    t.string   "lugarTumor"
    t.string   "institucionAtiende"
    t.string   "medicoTratante"
    t.string   "programaInteres"
    t.string   "club"
    t.string   "handicap"
    t.string   "redConecta"
    t.string   "intensidadSenal"
    t.string   "ubicacionFisica"
    t.string   "ipv4"
    t.string   "macAddress"
    t.string   "hotel"
    t.string   "habitacion"
    t.string   "usuario"
    t.string   "contrasena"
    t.string   "tiempoContrato"
    t.string   "dispositivo"
    t.string   "acuse"
    t.string   "fechaCirugia"
    t.string   "hospital"
    t.string   "tipoCirugia"
    t.string   "especidalidad"
    t.string   "paciente"
    t.string   "cargoPersona"
    t.string   "telefonoMedico"
    t.string   "equipoEspecial"
    t.string   "telefonoPaciente"
    t.string   "procedimiento"
    t.string   "fechaProcedimiento"
    t.string   "equipoDetenido"
    t.string   "fianza"
    t.string   "inclusion"
    t.string   "codigoSeguridad"
    t.string   "numeroControl"
    t.string   "lineaValidacion"
    t.string   "tipoPoliza"
    t.string   "telefonoFiado"
    t.string   "direccionFiado"
    t.string   "lugarFianza"
    t.string   "vendedorFianza"
    t.string   "formaPagoFianza"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cliente_id"
    t.string   "audioconferenciaReporta"
  end

  create_table "notifications", force: true do |t|
    t.integer  "cliente_id"
    t.integer  "sucursal_id"
    t.integer  "usuario_id"
    t.integer  "contacto_id"
    t.integer  "status_id"
    t.integer  "event_id"
    t.string   "notification"
    t.date     "startdate"
    t.time     "starttime"
    t.date     "duedate"
    t.time     "duetime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["cliente_id"], name: "index_notifications_on_cliente_id", using: :btree
  add_index "notifications", ["contacto_id"], name: "index_notifications_on_contacto_id", using: :btree
  add_index "notifications", ["event_id"], name: "index_notifications_on_event_id", using: :btree
  add_index "notifications", ["status_id"], name: "index_notifications_on_status_id", using: :btree
  add_index "notifications", ["sucursal_id"], name: "index_notifications_on_sucursal_id", using: :btree
  add_index "notifications", ["usuario_id"], name: "index_notifications_on_usuario_id", using: :btree

  create_table "pruebas", force: true do |t|
    t.string   "clave"
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: true do |t|
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sucursals", force: true do |t|
    t.integer  "cliente_id"
    t.string   "nombre"
    t.string   "telefono"
    t.integer  "contacto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "recepcionista_id"
    t.integer  "contactoprincipal_id"
    t.integer  "contactosecundario_id"
  end

  create_table "usuarios", force: true do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.boolean  "activo",                 default: true
    t.string   "role"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

end
