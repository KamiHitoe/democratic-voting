module Response
  # render records as json
  def json_response(object, status = :ok)
    render(json: object, status: status)
  end
end
