
defmodule NetworkStuff do
  @moduledoc """
  A bunch o' little titbits of code that may (or may not) make the elevator lab slightly more survivable
  """


  @doc """
  Returns (hopefully) the ip address of your network interface. 

  ## Examples
      iex> NetworkStuff.get_my_ip
      {10, 100, 23, 253}
  """

  def get_my_ip do
    {:ok, socket} = :gen_udp.open(6789, [active: false, broadcast: true])
    :ok = :gen_udp.send(socket, {255,255,255,255}, 6789, "test packet")
    ip = case :gen_udp.recv(socket, 100, 1000) do
      {:ok, {ip, _port, _data}} -> ip
      {:error, _} -> {:error, :could_not_get_ip}
    end
    :gen_udp.close(socket)
    ip
  end



  @doc """
  formats an ip address on tuple format to a bytestring
  ## Examples
      iex> NetworkStuff.ip_to_string {10, 100, 23, 253}
      '10.100.23.253'
  """

  def ip_to_string ip do
    :inet.ntoa(ip) |> to_string()
  end
end
