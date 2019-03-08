
defmodule NetworkStuff do
  @moduledoc """
  A bunch o' little titbits of code that may (or may not) make the elevator lab slightly more survivable
  """


  @doc """
  Returns (hopefully) the ip address of you network interface. 

  ## Examples
      iex> Kokeplata.get_all_button_types
      [:hall_up, :hall_down, :cab]
  """

  def get_my_ip do
    {:ok, socket} = :gen_udp.open(6789, [active: false, broadcast: true])
    :ok = :gen_udp.send(socket, {255,255,255,255}, 6789, "test packet")
    ip = case :gen_udp.recv(socket, 100, 1000) do
      {:ok, {ip, _port, _data}} -> {:ok, ip}
      {:error, _} -> {:error, :could_not_get_ip}
    end
    :gen_udp.close(socket)
    ip
  end

  def ip_to_string ip do
    :inet.ntoa ip
  end
  
end
