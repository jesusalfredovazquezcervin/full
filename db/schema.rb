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

ActiveRecord::Schema.define(version: 20150911191156) do

  create_table "captures", force: true do |t|
    t.boolean  "ticket"
    t.boolean  "fecha"
    t.boolean  "hora"
    t.boolean  "para"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "pruebas", force: true do |t|
    t.string   "clave"
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sucursals", force: true do |t|
    t.string   "cliente_id"
    t.string   "nombre"
    t.string   "telefono"
    t.string   "contacto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "recepcionista_id"
    t.integer  "contactoprincipal_id"
    t.integer  "contactosecundario_id"
  end

end
