require "rails_helper"

describe Note do

  describe "attributes" do

    let(:note) { Note.new }

    it { expect(note).to validate_presence_of :name }

  end
end

