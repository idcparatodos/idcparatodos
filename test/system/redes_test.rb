require "application_system_test_case"

class RedesTest < ApplicationSystemTestCase
  setup do
    @rede = redes(:one)
  end

  test "visiting the index" do
    visit redes_url
    assert_selector "h1", text: "Redes"
  end

  test "should create rede" do
    visit redes_url
    click_on "New rede"

    fill_in "Nome", with: @rede.nome
    fill_in "Token", with: @rede.token
    click_on "Create Rede"

    assert_text "Rede was successfully created"
    click_on "Back"
  end

  test "should update Rede" do
    visit rede_url(@rede)
    click_on "Edit this rede", match: :first

    fill_in "Nome", with: @rede.nome
    fill_in "Token", with: @rede.token
    click_on "Update Rede"

    assert_text "Rede was successfully updated"
    click_on "Back"
  end

  test "should destroy Rede" do
    visit rede_url(@rede)
    click_on "Destroy this rede", match: :first

    assert_text "Rede was successfully destroyed"
  end
end
