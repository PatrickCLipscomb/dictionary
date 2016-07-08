class Definition
  attr_reader(:definition, :example)
  define_method(:initialize) do |attributes|
    @definition = attributes.fetch(:definition)
    @example = attributes.fetch(:example)
  end
end
