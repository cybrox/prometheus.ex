defmodule Prometheus.Metric.Histogram do
  alias Prometheus.Metric

  defmacro new(spec) do
    {registry, _, _} = Metric.parse_spec(spec)

    quote do
      :prometheus_histogram.new(unquote(spec), unquote(registry))
    end
  end

  defmacro declare(spec) do
    {registry, _, _} = Metric.parse_spec(spec)

    quote do
      :prometheus_histogram.declare(unquote(spec), unquote(registry))
    end
  end

  defmacro observe(spec, value \\ 1) do
    {registry, name, labels} = Metric.parse_spec(spec)

    quote do
      :prometheus_histogram.observe(unquote(registry),
        unquote(name), unquote(labels),  unquote(value))
    end
  end

  defmacro dobserve(spec, value \\ 1) do
    {registry, name, labels} = Metric.parse_spec(spec)

    quote do
      :prometheus_histogram.dobserve(unquote(registry),
        unquote(name), unquote(labels), unquote(value))
    end
  end

  defmacro observe_duration(spec, fun) do
    {registry, name, labels} = Metric.parse_spec(spec)

    quote do
      :prometheus_histogram.observe_duration(unquote(name),
        unquote(registry), unquote(labels), unquote(fun))
    end
  end

  defmacro reset(spec) do
    {registry, name, labels} = Metric.parse_spec(spec)

    quote do
      :prometheus_histogram.reset(unquote(registry),
        unquote(name), unquote(labels))
    end
  end

  defmacro value(spec) do
    {registry, name, labels} = Metric.parse_spec(spec)

    quote do
      :prometheus_histogram.value(unquote(registry),
        unquote(name), unquote(labels))
    end
  end
end
