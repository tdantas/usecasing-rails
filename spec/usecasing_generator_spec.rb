require "spec_helper"

describe UsecasingGenerator do
  
  before do
    provisioning('usecase_app')
  end

  context "rails generate" do

    let(:file_path) { "app/usecases/finalize.rb" }

    context "usecasing without dependencies" do
    
      it "generates file" do
        rails_generate_usecase "finalize"
        check_file_presence([file_path], true)
      end

      it "generates file properly" do
        rails_generate_usecase "finalize"
        check_exact_file_content file_path, <<-EOF.heredoc_strip
        class Finalize < UseCase::Base
        end
        EOF
      end
    
    end


    context "usecasing with dependencies" do 
      
      it "generates usecase class with one depends chain" do

        rails_generate_usecase "finalize validate"
        check_exact_file_content file_path, <<-EOF.heredoc_strip
        class Finalize < UseCase::Base
          depends Validate
        end
        EOF
      end

      it "generates usecase class with multiple depends chain" do
        rails_generate_usecase "finalize validate send_email"
        check_exact_file_content file_path, <<-EOF.heredoc_strip
        class Finalize < UseCase::Base
          depends Validate, SendEmail
        end
        EOF
      end

    end
  
    context "namespacing" do 

      let(:file_path) { "app/usecases/namespace/finalize.rb" }
       
      it "generates namespaced usecase" do
        rails_generate_usecase "namespace::finalize"
        check_file_presence([file_path], true)
      end


      it "generates directory in downcase" do 
        rails_generate_usecase "NAMESPACE::finalize"
        check_file_presence([file_path], true)
      end


      it "generates multiple level" do 
        rails_generate_usecase "NAMESPACE::SECOND::finalize"
        check_file_presence(['app/usecases/namespace/second/finalize.rb'], true)
      end

    end
  end
end