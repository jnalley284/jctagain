module FixtureHelpers
  def fixture(path)
    absolute_path = File.expand_path("../../fixtures/#{path}",__FILE__)
    fixture = Dir.glob("#{absolute_path}").first

    raise ArgumentError, "Unable to find fixture #{path.inspect}" unless fixture
    fixture
  end
end
