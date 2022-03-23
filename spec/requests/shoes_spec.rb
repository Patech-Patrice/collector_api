require 'rails_helper'


RSpec.describe 'Collector API', type: :request do
        describe 'GET /shoes' do
            #this code gets executed before anything else in this do block
            before do
                FactoryBot.create(:shoe, 
                name:"name",
                designer:"designer"  )
                FactoryBot.create(:shoe,
                 name: "name",
                 designer: "designer"
                 )
                get '/api/v1/shoes'
            end    

            it 'returns all shoes' do
           
            get '/api/v1/shoes'

            expect(response).to have_http_status(:success)
            expect(JSON.parse(response.body).size).to eq(2)
        end    
    end
end




        describe 'POST /shoes' do
            it 'creates a new shoe' do
                expect {
                    # FactoryBot.create(:shoe,  name:"Mary Janes",  designer:"Prada", )
                post '/api/v1/shoes', params: { shoe: { name: 'Superstars', designer:'Adidas' } }
            }.to change { Shoe.count }.from(0).to(1)  
            expect(response).to have_http_status(:created)
        end
    end

   

    describe 'DELETE /shoes/:id' do
        #create a factory bot and assign it to handbag
    let!(:shoe) {FactoryBot.create(:shoe,  name: "Mary Jane", designer: "Prada" ) }
    it 'deletes a shoe' do
        expect {
         #string interpolation only works with double quotes
         delete "/api/v1/shoes/#{shoe.id}"
    }.to change { Shoe.count }.from(1).to(0)
        expect(response).to have_http_status(:no_content)
    end
end










   