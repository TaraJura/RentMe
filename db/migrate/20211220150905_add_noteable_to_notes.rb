class AddNoteableToNotes < ActiveRecord::Migration[6.1]
  def change
    add_reference :notes, :noteable, null: false, polymorphic: true
  end
end
