require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe PruebalocasController do

  # This should return the minimal set of attributes required to create a valid
  # Pruebaloca. As you add validations to Pruebaloca, be sure to
  # update the return value of this method accordingly.

  def valid_attributes
    {
      :nombre => "pepe",
      :pelos => 3
    }
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PruebalocasController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all pruebalocas as @pruebalocas" do
      pruebaloca = Pruebaloca.create! valid_attributes
      get :index, {}, valid_session
      assigns(:pruebalocas).should eq([pruebaloca])
    end
  end

  describe "GET show" do
    it "assigns the requested pruebaloca as @pruebaloca" do
      pruebaloca = Pruebaloca.create! valid_attributes
      get :show, {:id => pruebaloca.to_param}, valid_session
      assigns(:pruebaloca).should eq(pruebaloca)
    end
  end

  describe "GET new" do
    it "assigns a new pruebaloca as @pruebaloca" do
      get :new, {}, valid_session
      assigns(:pruebaloca).should be_a_new(Pruebaloca)
    end
  end

  describe "GET edit" do
    it "assigns the requested pruebaloca as @pruebaloca" do
      pruebaloca = Pruebaloca.create! valid_attributes
      get :edit, {:id => pruebaloca.to_param}, valid_session
      assigns(:pruebaloca).should eq(pruebaloca)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Pruebaloca" do
        expect {
          post :create, {:pruebaloca => valid_attributes}, valid_session
        }.to change(Pruebaloca, :count).by(1)
      end

      it "assigns a newly created pruebaloca as @pruebaloca" do
        post :create, {:pruebaloca => valid_attributes}, valid_session
        assigns(:pruebaloca).should be_a(Pruebaloca)
        assigns(:pruebaloca).should be_persisted
      end

      it "redirects to the created pruebaloca" do
        post :create, {:pruebaloca => valid_attributes}, valid_session
        response.should redirect_to(Pruebaloca.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved pruebaloca as @pruebaloca" do
        # Trigger the behavior that occurs when invalid params are submitted
        Pruebaloca.any_instance.stub(:save).and_return(false)
        post :create, {:pruebaloca => {}}, valid_session
        assigns(:pruebaloca).should be_a_new(Pruebaloca)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Pruebaloca.any_instance.stub(:save).and_return(false)
        post :create, {:pruebaloca => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested pruebaloca" do
        pruebaloca = Pruebaloca.create! valid_attributes
        # Assuming there are no other pruebalocas in the database, this
        # specifies that the Pruebaloca created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Pruebaloca.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => pruebaloca.to_param, :pruebaloca => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested pruebaloca as @pruebaloca" do
        pruebaloca = Pruebaloca.create! valid_attributes
        put :update, {:id => pruebaloca.to_param, :pruebaloca => valid_attributes}, valid_session
        assigns(:pruebaloca).should eq(pruebaloca)
      end

      it "redirects to the pruebaloca" do
        pruebaloca = Pruebaloca.create! valid_attributes
        put :update, {:id => pruebaloca.to_param, :pruebaloca => valid_attributes}, valid_session
        response.should redirect_to(pruebaloca)
      end
    end

    describe "with invalid params" do
      it "assigns the pruebaloca as @pruebaloca" do
        pruebaloca = Pruebaloca.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Pruebaloca.any_instance.stub(:save).and_return(false)
        put :update, {:id => pruebaloca.to_param, :pruebaloca => {}}, valid_session
        assigns(:pruebaloca).should eq(pruebaloca)
      end

      it "re-renders the 'edit' template" do
        pruebaloca = Pruebaloca.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Pruebaloca.any_instance.stub(:save).and_return(false)
        put :update, {:id => pruebaloca.to_param, :pruebaloca => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested pruebaloca" do
      pruebaloca = Pruebaloca.create! valid_attributes
      expect {
        delete :destroy, {:id => pruebaloca.to_param}, valid_session
      }.to change(Pruebaloca, :count).by(-1)
    end

    it "redirects to the pruebalocas list" do
      pruebaloca = Pruebaloca.create! valid_attributes
      delete :destroy, {:id => pruebaloca.to_param}, valid_session
      response.should redirect_to(pruebalocas_url)
    end
  end

end
