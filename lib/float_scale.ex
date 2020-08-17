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
    drop_mixin_table(FloatScale)
  end

end
