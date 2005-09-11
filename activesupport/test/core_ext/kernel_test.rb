require 'test/unit'
require File.dirname(__FILE__) + '/../../lib/active_support/core_ext/kernel'

class KernelTest < Test::Unit::TestCase
  def test_silence_warnings
    silence_warnings { assert_nil $VERBOSE }
    assert_equal 1234, silence_warnings { 1234 }
  end

  def test_silence_warnings_verbose_invariant
    old_verbose = $VERBOSE
    begin
      silence_warnings { raise }
      flunk
    rescue
      assert_equal old_verbose, $VERBOSE
    end
  end
  
  def test_silence_warnings_with_return_value
    assert_equal 1, silence_warnings { 1 }
  end
end
