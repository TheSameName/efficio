RSpec.describe "Sessions" do
  describe "Sessions#index GET /sessions" do
    context "when the user isn't authenticated" do
      it "redirects to sign in page" do
        get sessions_path
        expect(response).to redirect_to(sign_in_path)
      end
    end

    context "when the user is authenticated" do
      before { sign_in }

      it "renders the index template" do
        get sessions_path

        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "Sessions#new GET /sign_in" do
    it "render sign in page" do
      get sign_in_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /sign_in" do
    let!(:user) { create(:user) }

    context "with valid credentials" do
      before { post sign_in_path, params: { email: user.email, password: user.password } }

      it "creates a new session" do
        expect(user.sessions.count).to eq(1)
      end

      # TODO: Understand how to use ActionDispatch signed cookies in tests
      # it "sets the session cookie" do
      #   # expect(cookies.signed[:session_token]).to eq(user.sessions.first.id)
      # end

      it "redirects to root path" do
        expect(response).to redirect_to(home_path)
      end

      it "sets a flash notice" do
        expect(flash[:notice]).to eq("Signed in successfully")
      end
    end

    context "with invalid credentials" do
      before { post sign_in_path, params: { email: user.email, password: "wrong_password" } }

      it "doesn't create a new session" do
        expect(user.sessions.count).to eq(0)
      end

      it "redirects to sign in page with email hint" do
        expect(response).to redirect_to(sign_in_path(email_hint: user.email))
      end

      it "sets a flash alert" do
        expect(flash[:alert]).to eq("That email or password is incorrect")
      end
    end
  end

  describe "DELETE #destroy" do
    let(:user) { create(:user) }

    before do
      sign_in(user)
      session = user.sessions.first
      delete session_path(session.id)
    end

    it "destroys the session" do
      expect(user.sessions.count).to eq(0)
    end

    it "redirects to sessions path" do
      expect(response).to redirect_to(sessions_path)
    end

    it "sets a flash notice" do
      expect(flash[:notice]).to eq("That session has been logged out")
    end
  end
end
