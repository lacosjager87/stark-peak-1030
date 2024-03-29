require 'spec_helper'

describe "UserPages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1',    text: 'Sign up') }
    it { should have_selector('title', text: full_title('Sign up')) }
  end

	describe "profile page" do
		let(:user) { FactoryGirl.create(:user) }
	  # Code to make a user variable
	  before { visit user_path(user) }

	  it { should have_selector('h1',    text: user.name) }
	  it { should have_selector('title', text: user.name) }
	end

	describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
				## azt hasonlitja ossze h a userek szama voltozik-e, mert lefuttatja elotte meg utanna
			## a count onnan jon h a user egy activeracordos osztaly es annak van countja alapbol, itt a count csak egy szimbolum es azt hivja meg ugye
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end


end
