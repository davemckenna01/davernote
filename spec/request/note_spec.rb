require "rails_helper"

describe "Notes" do

  describe "GET /notes" do

    context "empty database" do

      before(:each) do
        visit "/notes"
      end

      it "responds with success" do
        expect(page.status_code).to be(200)
      end

      it "shows link to create note" do
        expect(page).to have_selector "a", text: "New note"
      end

    end

    context "populated database" do

      fixtures :notes

      before(:each) do
        visit "/notes"
      end

      it "shows a list of notes" do
        # save_and_open_page
        expect(page).to have_selector "li a", text: "First note boyee"
        expect(page).to have_selector "li a", text: "Second note boyee"
      end

    end

  end

  describe "GET /notes/:id" do

    fixtures :notes

    before(:each) do
      note = notes(:first)
      visit "/notes/#{note.id}"
    end

    it "responds with success" do
      expect(page.status_code).to be(200)
    end

    it "displays the note's name" do
        expect(page).to have_selector "h2", text: "First note boyee"
    end

    it "displays the note's content" do
        expect(page).to have_selector "div.content", text: "Shouldn't this be a recipe or something?"
    end
  end

  describe "POST /notes" do

    before :each do
      visit "/notes/new"
      # save_and_open_page
      fill_in "Name", with: "Third note boyee"
      fill_in "Content", with: "MC Miker G is the best"
      click_on "Submit"
    end

    let(:note) { Note.find_by_name "Third note boyee" }

    it "creates a valid record" do
      expect(note).to be_valid
    end

  end

  describe "PUT /notes/:id" do

    fixtures :notes

    before :each do
      note = notes(:first)
      visit "/notes/#{note.id}/edit"
      # save_and_open_page
      fill_in "Name", with: "First note boyee EDITED!"
      click_on "Submit"
    end

    let(:first_note_edited) { Note.find_by_name "First note boyee EDITED!" }
    let(:first_note_orig) { Note.find_by_name "First note boyee" }

    it "creates a valid record" do
      expect(first_note_edited).to be_valid
    end

    it "replaces an existing note" do
      expect(first_note_orig).to be_nil
      expect(first_note_edited.content).to eq "Shouldn't this be a recipe or something?"
    end

  end

end