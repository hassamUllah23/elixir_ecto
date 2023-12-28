defmodule ElixirEcto.ResponseMessages do
  def createSuccessRespose(module) when is_binary(module) do
    "#{module} created succesfully!"
  end

  def createFailureRespose(module) when is_binary(module) do
    "Failed to create #{module}!"
  end

  def updateSuccessRespose(module) when is_binary(module) do
    "#{module} updated succesfully!"
  end

  def updateFailureRespose(module) when is_binary(module) do
    "Failed to update #{module}!"
  end

  def deleteSuccessRespose(module) when is_binary(module) do
    "#{module} deleted succesfully!"
  end

  def deleteFailureRespose(module) when is_binary(module) do
    "Failed to delete #{module}!"
  end

  def notFoundRespose(module) when is_binary(module) do
    "No #{module} found!"
  end
end
