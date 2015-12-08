require "rails_helper"

describe "Tags" do

  describe "GET /tags" do

    context "empty database" do

      before(:each) do
        visit "/tags"
      end

      it "responds with success" do
        expect(page.status_code).to be(200)
      end

      # it "shows link to create note" do
      #   expect(page).to have_selector "a", text: "New note"
      # end

    end
  end

end