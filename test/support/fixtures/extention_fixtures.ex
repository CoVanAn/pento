defmodule Pento.ExtentionFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Pento.Extention` context.
  """

  @doc """
  Generate a faq.
  """
  def faq_fixture(attrs \\ %{}) do
    {:ok, faq} =
      attrs
      |> Enum.into(%{
        answer: "some answer",
        question: "some question",
        vote_count: 120.5
      })
      |> Pento.Extention.create_faq()

    faq
  end
end
