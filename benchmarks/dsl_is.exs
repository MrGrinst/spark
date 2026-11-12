# SPDX-FileCopyrightText: 2022 spark contributors <https://github.com/ash-project/spark/graphs/contributors>
#
# SPDX-License-Identifier: MIT

defmodule DslIsBench.Contact do
  use Spark.Dsl, default_extensions: []
end

defmodule DslIsBench.Ted do
  use DslIsBench.Contact
end

Benchee.run(
  %{
    "dsl module" => fn -> Spark.Dsl.is?(DslIsBench.Ted, DslIsBench.Contact) end,
    "loaded non-dsl module" => fn -> Spark.Dsl.is?(String, DslIsBench.Contact) end
  },
  time: 5,
  warmup: 2
)
