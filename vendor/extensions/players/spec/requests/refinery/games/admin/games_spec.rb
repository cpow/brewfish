# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Games" do
    describe "Admin" do
      describe "games" do
        login_refinery_user

        describe "games list" do
          before(:each) do
            FactoryGirl.create(:game, :opponent => "UniqueTitleOne")
            FactoryGirl.create(:game, :opponent => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.games_admin_games_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.games_admin_games_path

            click_link "Add New Game"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Opponent", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Games::Game.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Opponent can't be blank")
              Refinery::Games::Game.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:game, :opponent => "UniqueTitle") }

            it "should fail" do
              visit refinery.games_admin_games_path

              click_link "Add New Game"

              fill_in "Opponent", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Games::Game.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:game, :opponent => "A opponent") }

          it "should succeed" do
            visit refinery.games_admin_games_path

            within ".actions" do
              click_link "Edit this game"
            end

            fill_in "Opponent", :with => "A different opponent"
            click_button "Save"

            page.should have_content("'A different opponent' was successfully updated.")
            page.should have_no_content("A opponent")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:game, :opponent => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.games_admin_games_path

            click_link "Remove this game forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Games::Game.count.should == 0
          end
        end

      end
    end
  end
end
