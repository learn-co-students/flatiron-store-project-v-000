describe 'Feature Test: Store', :type => :feature do
    describe "Category List" do
      it "displays all of the categories as links" do
        visit store_path
        Category.all.each do |category|
          expect(page).to have_link(category.title, href: category_path(category))
        end
      end
    end

    describe "Item List" do
      it 'displays all items that have inventory' do
        second_item = Item.second
        second_item.inventory = 0
        second_item.save
        visit store_path
        Item.all.each do |item|
          if item == second_item
            expect(page).to_not have_content item.title
          else
            expect(page).to have_content item.title
            expect(page).to have_content "$#{item.price.to_f/100}"
          end
        end
      end

      context "not logged in" do

        it 'does not display "Add To Cart" button' do
          visit store_path
          expect(page).to_not have_content "Add To Cart"
        end

      end

      context "logged in" do
        before(:each) do
          @user = User.first
          login_as(@user, scope: :user)
        end

        it 'does display "Add To Cart" button' do
          visit store_path
          expect(page).to have_selector("input[type=submit][value='Add to Cart']")
        end
      end

    end

    describe 'Headers' do

      context "not logged in" do

        it 'has a sign in link' do
          visit store_path
          expect(page).to have_link("sign in")
        end

        it 'has a sign up link' do
          visit store_path
          expect(page).to have_link("Sign up")
        end

      end

      context "logged in" do
        before(:each) do
          @user = User.first
          login_as(@user, scope: :user)
        end

        it "tells the user who they are signed in as" do
          visit store_path
          expect(page).to have_content("Signed in as #{@user.email}")
        end

        it "has a sign out link" do
          visit store_path
          expect(page).to have_link("Sign out")
        end

        it "lets users sign out" do
          visit store_path
          click_link("Sign out")
          expect(page.current_path).to eq(store_path)
          expect(page).to have_link("sign in")
        end
      end

      it 'has a Store Home Link' do
        visit store_path
        expect(page).to have_link("Store Home")
      end

      it 'does not have a Cart link' do
        visit store_path
        expect(page).to_not have_link("Cart")
      end
    end


end
