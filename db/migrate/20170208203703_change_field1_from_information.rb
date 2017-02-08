class ChangeField1FromInformation < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :information do |t|
        dir.up   { t.change :field1, :text}
        dir.down { t.change :field1 , :string}

        dir.up   { t.change :field2, :text}
        dir.down { t.change :field2 , :string}

        dir.up   { t.change :field3, :text}
        dir.down { t.change :field3 , :string}

        dir.up   { t.change :field4, :text}
        dir.down { t.change :field4 , :string}

        dir.up   { t.change :field5, :text}
        dir.down { t.change :field5 , :string}

        dir.up   { t.change :field6, :text}
        dir.down { t.change :field6 , :string}

        dir.up   { t.change :field7, :text}
        dir.down { t.change :field7 , :string}

        dir.up   { t.change :field8, :text}
        dir.down { t.change :field8 , :string}

        dir.up   { t.change :field9, :text}
        dir.down { t.change :field9 , :string}

        dir.up   { t.change :field10, :text}
        dir.down { t.change :field10 , :string}

        dir.up   { t.change :field11, :text}
        dir.down { t.change :field11 , :string}

        dir.up   { t.change :field12, :text}
        dir.down { t.change :field12 , :string}

        dir.up   { t.change :field13, :text}
        dir.down { t.change :field13 , :string}

        dir.up   { t.change :field14, :text}
        dir.down { t.change :field14 , :string}

        dir.up   { t.change :field15, :text}
        dir.down { t.change :field15 , :string}

        dir.up   { t.change :field16, :text}
        dir.down { t.change :field16 , :string}

        dir.up   { t.change :field17, :text}
        dir.down { t.change :field17 , :string}

        dir.up   { t.change :field18, :text}
        dir.down { t.change :field18 , :string}

        dir.up   { t.change :field19, :text}
        dir.down { t.change :field19 , :string}

        dir.up   { t.change :field20, :text}
        dir.down { t.change :field20 , :string}
      end
    end
  end
end
