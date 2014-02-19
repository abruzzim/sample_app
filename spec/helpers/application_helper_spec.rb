require 'spec_helper'

describe ApplicationHelper do
  describe "full_title" do
    let(:base_title) { 'Sample App' }
    it "returns the full page title" do
      expect(full_title("Test")).to eq("#{base_title} | Test")
    end
    it "includes the base title" do
      expect(full_title("Test")).to include("#{base_title}")
    end
    it "does not include the '|' character for the Home page" do
      expect(full_title("")).to_not include("|")
    end
  end
end