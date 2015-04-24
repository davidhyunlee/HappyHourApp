class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.time :mon_open
      t.time :tue_open
      t.time :wed_open
      t.time :thu_open
      t.time :fri_open
      t.time :sat_open
      t.time :sun_open
      t.time :mon_close
      t.time :tue_close
      t.time :wed_close
      t.time :thu_close
      t.time :fri_close
      t.time :sat_close
      t.time :sun_close
      t.time :mon_start
      t.time :tue_start
      t.time :wed_start
      t.time :thu_start
      t.time :fri_start
      t.time :sat_start
      t.time :sun_start
      t.time :mon_end
      t.time :tue_end
      t.time :wed_end
      t.time :thu_end
      t.time :fri_end
      t.time :sat_end
      t.time :sun_end
      t.belongs_to :business, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
