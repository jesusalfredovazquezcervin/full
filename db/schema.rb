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

ActiveRecord::Schema.define(version: 20151026204246) do

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
    t.datetime "avisoFechaHora"
    t.string   "notificoNombre"
    t.datetime "notificoFechaHora"
    t.string   "rllsOperador"
    t.datetime "rllsFechaHora"
    t.time     "tiempoRespuesta"
    t.string   "notificacionLlegadaSitio"
    t.string   "rteOperador"
    t.datetime "rteFechaHora"
    t.string   "situacionEmergencia"
    t.string   "duracionEmeregencia",      limit: nil
    t.string   "faltaSuministroGas"
    t.string   "tipoLlamada"
    t.string   "codigo"
    t.datetime "horaEnlace"
    t.string   "medioSeEntero"
    t.datetime "terminoChat"
    t.string   "razaMascota"
    t.string   "edad",                     limit: nil
    t.integer  "codigoAcceso"
    t.integer  "codigoOrganizador"
    t.string   "fijoMovil"
    t.integer  "telefonoOrigen"
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
    t.decimal  "montoReportar",                        precision: 7, scale: 2
    t.string   "enlazadaCorrectamente"
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
    t.string   "acuse"
    t.datetime "fechaCirugia"
    t.string   "hospital"
    t.string   "tipoCirugia"
    t.string   "especidalidad"
    t.string   "paciente"
    t.string   "cargoPersona"
    t.string   "telefonoMedico"
    t.string   "equipoEspecial"
    t.string   "telefonoPaciente"
    t.string   "procedimiento"
    t.datetime "fechaProcedimiento"
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
    t.string   "audioconferenciaReporta"
    t.integer  "sucursal_id"
  end

  add_index "captures", ["sucursal_id"], name: "index_captures_on_sucursal_id", using: :btree

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
    t.boolean  "ticket"
    t.boolean  "compania"
    t.boolean  "polizaContrato"
    t.boolean  "descripcionEmergencia"
    t.boolean  "identificarSistema"
    t.boolean  "referencia"
    t.boolean  "comentariosExtra"
    t.boolean  "avisoNombre"
    t.boolean  "avisoFecha"
    t.boolean  "notificoNombre"
    t.boolean  "notificoFechaHora"
    t.boolean  "rllsOperador"
    t.boolean  "rllsFechaHora"
    t.boolean  "tiempoRespuesta"
    t.boolean  "notificacionLlegadaSitio"
    t.boolean  "rteOperador"
    t.boolean  "rteFechaHora"
    t.boolean  "situacionEmergencia"
    t.boolean  "duracionEmeregencia"
    t.boolean  "faltaSuministroGas"
    t.boolean  "sucursal"
    t.boolean  "tipoLlamada"
    t.boolean  "codigo"
    t.boolean  "horaEnlace"
    t.boolean  "medioSeEntero"
    t.boolean  "terminoChat"
    t.boolean  "razaMascota"
    t.boolean  "edad"
    t.boolean  "codigoAcceso"
    t.boolean  "codigoOrganizador"
    t.boolean  "fijoMovil"
    t.boolean  "telefonoOrigen"
    t.boolean  "paisOrigino"
    t.boolean  "localidadOrigino"
    t.boolean  "motivoDenuncia"
    t.boolean  "tipoDelito"
    t.boolean  "puestoInvolucrado"
    t.boolean  "resultadoEstatus"
    t.boolean  "emailContacto"
    t.boolean  "marca"
    t.boolean  "modelo"
    t.boolean  "serie"
    t.boolean  "beneficiario"
    t.boolean  "contactoBeneficiario"
    t.boolean  "nombreFiado"
    t.boolean  "puestoFiado"
    t.boolean  "montoReportar"
    t.boolean  "enlazadaCorrectamente"
    t.boolean  "intentosEnlace"
    t.boolean  "duracionLlamada"
    t.boolean  "origenCodigoGami"
    t.boolean  "codigoGami"
    t.boolean  "tipoEmergencia"
    t.boolean  "empresaCodigoGami"
    t.boolean  "nomenclaturaSistema"
    t.boolean  "personaRecibe"
    t.boolean  "razonSocial"
    t.boolean  "rfc"
    t.boolean  "ticketCliente"
    t.boolean  "relacionPaciente"
    t.boolean  "lugarTumor"
    t.boolean  "institucionAtiende"
    t.boolean  "medicoTratante"
    t.boolean  "programaInteres"
    t.boolean  "club"
    t.boolean  "handicap"
    t.boolean  "redConecta"
    t.boolean  "intensidadSenal"
    t.boolean  "ubicacionFisica"
    t.boolean  "ipv4"
    t.boolean  "macAddress"
    t.boolean  "hotel"
    t.boolean  "habitacion"
    t.boolean  "usuario"
    t.boolean  "contrasena"
    t.boolean  "tiempoContrato"
    t.boolean  "dispositivo"
    t.boolean  "acuse"
    t.boolean  "fechaCirugia"
    t.boolean  "hospital"
    t.boolean  "tipoCirugia"
    t.boolean  "especidalidad"
    t.boolean  "paciente"
    t.boolean  "cargoPersona"
    t.boolean  "telefonoMedico"
    t.boolean  "equipoEspecial"
    t.boolean  "telefonoPaciente"
    t.boolean  "procedimiento"
    t.boolean  "fechaProcedimiento"
    t.boolean  "equipoDetenido"
    t.boolean  "fianza"
    t.boolean  "inclusion"
    t.boolean  "codigoSeguridad"
    t.boolean  "numeroControl"
    t.boolean  "lineaValidacion"
    t.boolean  "tipoPoliza"
    t.boolean  "telefonoFiado"
    t.boolean  "direccionFiado"
    t.boolean  "lugarFianza"
    t.boolean  "vendedorFianza"
    t.boolean  "formaPagoFianza"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cliente_id"
    t.boolean  "audioconferenciaReporta"
  end

  create_table "pruebas", force: true do |t|
    t.string   "clave"
    t.string   "nombre"
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
