# Copyright 2014 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


module Google
  module Cloud
    module Trace
      ##
      # Utils provides some internal utility methods for Trace.
      #
      # @private
      #
      module Utils
        ##
        # Convert a Ruby Time object to a timestamp proto object.
        #
        # @private
        #
        def self.time_to_grpc time
          return nil if time.nil?

          # sometimes this gets called with time as a float or
          # int. Coerce into a time object, and move on.
          time = Time.at(time) if time.is_a? Numeric

          raise ArgumentError unless time.is_a? Time

          Google::Protobuf::Timestamp.new seconds: time.to_i,
                                          nanos: time.nsec
        end

        ##
        # Convert a Timestamp proto object to a Ruby Time object.
        #
        # @private
        #
        def self.grpc_to_time grpc
          Time.at(grpc.seconds, Rational(grpc.nanos, 1000)).utc
        end
      end
    end
  end
end
