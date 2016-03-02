describe 'Feature Test: Category', :type => :feature do

  describe "Item List" do
    before(:each) do
      @category = Category.first
      @items = @category.items
      visit category_path(@category)
    end

    it "Lists Category Title" do
      expect(page).to have_content @category.title
    end
    it "lists all of the items in that category" do
      @items.each do |item|
        expect(page).to have_content item.title
        expect(page).to have_content "$#{item.price.to_f/100}"
      end
    end

    context "not logged in" do

      it 'does not display "Add To Cart" button' do
        expect(page).to_not have_content "Add To Cart"
      end

    end

    context "logged in" do
      before(:each) do
        @user = User.first
        login_as(@user, scope: :user)
      end

      it 'does display "Add To Cart" button' do
        visit category_path(@category)
        expect(page).to have_selector("input[type=submit][value='Add to Cart']")
      end
    end
  end
end
