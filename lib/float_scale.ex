defmodule CommonsPub.Scales.FloatScale do
  @moduledoc "A float scale against which things can be measured."

  use Pointers.Pointable,
    otp_app: :cpub_scales,
    table_id: "SCA1ESMEASVR1NGF10ATVA1VES",
    source: "cpub_scales_float_scale"

  alias CommonsPub.Scales.{FloatMarker, FloatReading}

  pointable_schema do
    has_many :readings, FloatReading
  end

end
defmodule CommonsPub.Scales.FloatScale.Migration do

  import Ecto.Migration
  import Pointers.Migration
  alias CommonsPub.Scales.FloatScale

  @doc """
  Migrates the FloatScale table. Direction is autodetected by default.
  """
  def migrate_float_scale(dir \\ direction())
  def migrate_float_scale(:up) do
    create_pointable_table(FloatScale) do
    end
  end

  defp migrate_float_scale(down) do
    drop_pointable_table(FloatScale)
  end


  def insert_float_scale(id) do
    id = Pointers.ULID.cast!(id)
    Repo.insert_all(FloatScale, [%{id: id}])
  end

  def delete_float_scale(id) do
    id = Pointers.ULID.cast!(id)
    Repo.delete_all(from s in FloatScale, where: id == ^id)
  end

end
