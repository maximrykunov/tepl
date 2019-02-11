class CreateApps < ActiveRecord::Migration[5.2]
  def self.up
    create_table :apps do |t|
      t.string :name
      t.string :sub_domain

      t.timestamps
    end
    App.where(sub_domain: '', name: 'Медалак').first_or_create
    App.where(sub_domain: 'teplicy', name: 'Теплицы').first_or_create
    App.where(sub_domain: 'teplo', name: 'Тепло').first_or_create
    App.where(sub_domain: 'drenaj', name: 'Дренаж').first_or_create
  end

  def self.down
    drop_table :apps
  end
end
