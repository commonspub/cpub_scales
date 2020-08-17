defmodule CommonsPub.Scales.IntReading do
  @moduledoc "A value on an integer scale."

  use Pointers.Pointable,
    otp_app: :cpub_scales,
    table_id: "READ1NGSARETHESCA1EDVA1VES",
    source: "cpub_scales_reading"

  alias CommonsPub.Scales.IntScale

  pointable_schema do
    belongs_to :scale, IntScale
    field :reading, :integer
  end

  @create [:id, :scale_id, :reading]

  def create(attrs) do
    Changeset.cast(%IntReading{}, attrs, @create)
    |> Changeset.validate_required(@create)
  end

  @update [:reading]

  def update(%IntReading{} = reading, attrs) do
    Changeset.cast(reading, attrs, @update)
  end

end
defmodule CommonsPub.Scales.IntReading.Migration do

  import Ecto.Migration
  import Pointers.Migration
  import CommonsPub.Scales.IntScale.Migration, only: [int_scale_table: 0]
  alias CommonsPub.Scales.IntReading

  defp int_reading_table(), do: IntReading.__schema__(:source)

  @doc """
  Migrates the IntReading table. Takes optional index options for
  the index on the `reading` column. Direction is autodetected by default.
  """
  def migrate_int_reading(index_opts \\ [], dir \\ direction())
  def migrate_int_reading(index_opts, :up) do
    create_pointable_table(IntReading) do
    end
    create index(int_reading_table(), [:reading], index_opts)
  end

  defp migrate_int_reading(index_opts, :down) do
    drop index(int_reading_table(), [:reading], index_opts)
    drop_pointable_table(IntReading)
  end

end
