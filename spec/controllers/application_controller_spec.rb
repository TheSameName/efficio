RSpec.describe ApplicationController do
  describe "authentication" do
    controller do
      before_action :authenticate!

      def index
        render plain: "Hello, world!"
      end
    end

    context "when the user is not authenticated" do
      it "redirects to the sign in page" do
        get :index
        expect(response).to redirect_to(sign_in_path)
      end
    end

    context "when the user is authenticated" do
      before { sign_in }

      it "renders the index template" do
        get :index
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
