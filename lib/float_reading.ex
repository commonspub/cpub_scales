defmodule CommonsPub.Scales.FloatReading do
  @moduledoc "A value on a floating point scale."

  use Pointers.Pointable,
    otp_app: :cpub_scales,
    table_id: "READ1NGSARETHESCA1EDF10ATS",
    source: "cpub_scales_float_reading"

  alias CommonsPub.Scales.{FloatReading, FloatScale}
  alias Ecto.Changeset

  pointable_schema do
    belongs_to :scale, FloatScale
    field :reading, :float
  end

  @create [:id, :scale_id, :reading]

  def create(attrs) do
    Changeset.cast(%FloatReading{}, attrs, @create)
    |> Changeset.validate_required(@create)
  end

  @update [:reading]

  def update(%FloatReading{} = reading, attrs) do
    Changeset.cast(reading, attrs, @update)
  end

end
defmodule CommonsPub.Scales.FloatReading.Migration do

  import Ecto.Migration
  import Pointers.Migration
  alias CommonsPub.Scales.{FloatScale, FloatReading}

  @doc """
  Migrates the FloatReading table. Takes optional index options for
  the index on the `reading` column. Direction is autodetected by default.
  """
  def migrate_float_reading(index_opts \\ [], dir \\ direction())
  def migrate_float_reading(index_opts, :up) do
    create_pointable_table(FloatReading) do
      add strong_pointer(FloatScale)
      add :reading, :timestamptz, null: false
    end
    create index(FloatReading.__schema__(:source), [:reading], index_opts)
  end

  defp migrate_float_reading(index_opts, :down) do
    drop index(FloatReading.__schema__(:source), [:reading], index_opts)
    drop_pointable_table(FloatReading)
  end

end
