defmodule Pento.ExtentionTest do
  use Pento.DataCase

  alias Pento.Extention

  describe "faqs" do
    alias Pento.Extention.FAQ

    import Pento.ExtentionFixtures

    @invalid_attrs %{question: nil, answer: nil, vote_count: nil}

    test "list_faqs/0 returns all faqs" do
      faq = faq_fixture()
      assert Extention.list_faqs() == [faq]
    end

    test "get_faq!/1 returns the faq with given id" do
      faq = faq_fixture()
      assert Extention.get_faq!(faq.id) == faq
    end

    test "create_faq/1 with valid data creates a faq" do
      valid_attrs = %{question: "some question", answer: "some answer", vote_count: 120.5}

      assert {:ok, %FAQ{} = faq} = Extention.create_faq(valid_attrs)
      assert faq.question == "some question"
      assert faq.answer == "some answer"
      assert faq.vote_count == 120.5
    end

    test "create_faq/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Extention.create_faq(@invalid_attrs)
    end

    test "update_faq/2 with valid data updates the faq" do
      faq = faq_fixture()
      update_attrs = %{question: "some updated question", answer: "some updated answer", vote_count: 456.7}

      assert {:ok, %FAQ{} = faq} = Extention.update_faq(faq, update_attrs)
      assert faq.question == "some updated question"
      assert faq.answer == "some updated answer"
      assert faq.vote_count == 456.7
    end

    test "update_faq/2 with invalid data returns error changeset" do
      faq = faq_fixture()
      assert {:error, %Ecto.Changeset{}} = Extention.update_faq(faq, @invalid_attrs)
      assert faq == Extention.get_faq!(faq.id)
    end

    test "delete_faq/1 deletes the faq" do
      faq = faq_fixture()
      assert {:ok, %FAQ{}} = Extention.delete_faq(faq)
      assert_raise Ecto.NoResultsError, fn -> Extention.get_faq!(faq.id) end
    end

    test "change_faq/1 returns a faq changeset" do
      faq = faq_fixture()
      assert %Ecto.Changeset{} = Extention.change_faq(faq)
    end
  end
end
