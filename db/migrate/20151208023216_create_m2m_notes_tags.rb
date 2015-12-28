class CreateM2mNotesTags < ActiveRecord::Migration
  def change
    create_table :notes_tags, id: false do |t|
      t.belongs_to :note, index: true
      t.belongs_to :tag, index: true      
    end
  end
end
