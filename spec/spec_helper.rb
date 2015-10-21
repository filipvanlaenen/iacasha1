# encoding: utf-8
#

$LOAD_PATH << 'lib'
require 'sha1'

require 'timeout'

RSpec.configure do |config|
  config.around do |example|
    Timeout.timeout(10) do
      example.run
    end
  end
end
