defmodule ElixirEcto.AllowedValues do
  def allowedDatapointValues() do
    e1 = "E1"
    e2 = "E2"
    e3 = "E3"
    e4 = "E4"
    e5 = "E5"
    s1 = "S1"
    s2 = "S2"
    s3 = "S3"
    s4 = "S4"
    g1 = "G1"

    esrsIdentifiers = [e1, e2, e3, e4, e5, s1, s2, s3, s4, g1]

    e1Drs = [
      e1 <> "-1",
      e1 <> "-2",
      e1 <> "-3",
      e1 <> "-4",
      e1 <> "-5",
      e1 <> "-6",
      e1 <> "-7",
      e1 <> "-8",
      e1 <> "-9",
      e1 <> ".GOV-3",
      e1 <> ".IRO-1",
      e1 <> ".SBM-3"
    ]

    e2Drs = [
      e2 <> "-1",
      e2 <> "-2",
      e2 <> "-3",
      e2 <> "-4",
      e2 <> "-5",
      e2 <> "-6",
      e2 <> ".IRO-1"
    ]

    e3Drs = [
      e3 <> "-1",
      e3 <> "-2",
      e3 <> "-3",
      e3 <> "-4",
      e3 <> "-5",
      e3 <> ".IRO-1"
    ]

    e4Drs = [
      e4 <> "-1",
      e4 <> "-2",
      e4 <> "-3",
      e4 <> "-4",
      e4 <> "-5",
      e4 <> "-6",
      e4 <> ".IRO-1",
      e4 <> ".SBM-3"
    ]

    e5Drs = [
      e5 <> "-1",
      e5 <> "-2",
      e5 <> "-3",
      e5 <> "-4",
      e5 <> "-5",
      e5 <> "-6",
      e5 <> ".IRO-1"
    ]

    s1Drs = [
      s1 <> "-1",
      s1 <> "-2",
      s1 <> "-3",
      s1 <> "-4",
      s1 <> "-5",
      s1 <> "-6",
      s1 <> "-7",
      s1 <> "-8",
      s1 <> "-9",
      s1 <> "-10",
      s1 <> "-11",
      s1 <> "-12",
      s1 <> "-13",
      s1 <> "-14",
      s1 <> "-15",
      s1 <> "-16",
      s1 <> "-17",
      s1 <> ".SBM-3"
    ]

    s2Drs = [
      s2 <> "-1",
      s2 <> "-2",
      s2 <> "-3",
      s2 <> "-4",
      s2 <> "-5",
      s2 <> ".SBM-3"
    ]

    s3Drs = [
      s3 <> "-1",
      s3 <> "-2",
      s3 <> "-3",
      s3 <> "-4",
      s3 <> "-5",
      s3 <> ".SBM-3"
    ]

    s4Drs = [
      s4 <> "-1",
      s4 <> "-2",
      s4 <> "-3",
      s4 <> "-4",
      s4 <> "-5",
      s4 <> ".SBM-3"
    ]

    g1Drs = [
      g1 <> "-1",
      g1 <> "-2",
      g1 <> "-3",
      g1 <> "-4",
      g1 <> "-5",
      g1 <> ".GOV-1"
    ]

    # allowedDrs = [

    # ]

    allowedDatatypes = [
      "integer",
      "date",
      "percent",
      "energy",
      "mass",
      "volume",
      "Intensity",
      "ghgEmissions",
      "gYear",
      "monetary",
      "narrative",
      "semi-narrative",
      "table",
      "table/decimal",
      "table/integer",
      "table/numerical",
      "table/percent",
      "table/ghgEmissions",
      "table/monetary",
      "table/narrative",
      "table/semi-narrative",
      "table/mass",
      "table/volume",
      "mdr-a",
      "mdr-p",
      "mdr-t"
    ]

    allowedAppendices = [
      "sfdr",
      "benchmark",
      "pillar3",
      "sfdr/benchmark",
      "benchmark/pillar3",
      "sfdr/benchmark/pillar3",
      "cl",
      ""
    ]

    %{
      appendices: allowedAppendices,
      drs: e1Drs ++ e2Drs ++ e3Drs ++ e4Drs ++ e5Drs ++ s1Drs ++ s2Drs ++ s3Drs ++ s4Drs ++ g1Drs,
      datatypes: allowedDatatypes,
      esrs_identifiers: esrsIdentifiers
    }
  end

  def allowedStandards() do
    ["E1", "E2", "E3", "E4", "E5", "S1", "S2", "S3", "S4", "G1"]
  end
end
