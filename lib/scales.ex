defmodule CommonsPub.Scales.Migration do

  alias CommonsPub.Scales.{FloatReading, FloatScale, IntReading, IntScale}
  import Ecto.Migration

  @doc "Performs a standard migration for all tables."
  def migrate(dir \\ direction())
  def migrate(:up)
    FloatScale.Migration.migrate_float_scale(:up)
    FloatReading.Migration.migrate_float_reading(:up)
    IntScale.Migration.migrate_int_scale(:up)
    IntReading.Migration.migrate_int_reading(:up)
  end

  def migrate(:down)
    IntReading.Migration.migrate_int_reading(:down)
    IntScale.Migration.migrate_int_scale(:down)
    FloatReading.Migration.migrate_float_reading(:down)
    FloatScale.Migration.migrate_float_scale(:down)
  end

end
