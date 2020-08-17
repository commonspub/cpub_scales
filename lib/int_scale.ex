defmodule CommonsPub.Scales.IntScale do
  @moduledoc "An integer scale against which things can be measured."

  use Pointers.Pointable,
    otp_app: :cpub_scales,
    table_id: "SCA1ESMEASVR1NG1NTSF0RG00D",
    source: "cpub_scales_int_scale"

  alias CommonsPub.Scales.{IntMarker, IntReading}

  pointable_schema do
    has_many :markers, IntMarker
    has_many :readings, IntReading
  end

end
defmodule CommonsPub.Scales.IntScale.Migration do

  import Ecto.Migration
  import Pointers.Migration
  alias CommonsPub.Scales.IntScale

  @doc """
  Migrates the IntScale table. Direction is autodetected by default.
  """
  def migrate_int_scale(dir \\ direction())
  def migrate_int_scale(:up) do
    create_pointable_table(IntScale) do
    end
  end

  defp migrate_int_scale(:down) do
    drop_pointable_table(IntScale)
  end

end

