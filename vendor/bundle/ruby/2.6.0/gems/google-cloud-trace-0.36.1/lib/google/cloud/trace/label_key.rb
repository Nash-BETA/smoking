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


require "json"

module Google
  module Cloud
    module Trace
      ##
      # A collection of well-known label keys for trace spans.
      #
      module LabelKey
        AGENT = "/agent".freeze
        COMPONENT = "/component".freeze
        ERROR_MESSAGE = "/error/message".freeze
        ERROR_NAME = "/error/name".freeze
        HTTP_CLIENT_CITY = "/http/client_city".freeze
        HTTP_CLIENT_COUNTRY = "/http/client_country".freeze
        HTTP_CLIENT_PROTOCOL = "/http/client_protocol".freeze
        HTTP_CLIENT_REGION = "/http/client_region".freeze
        HTTP_HOST = "/http/host".freeze
        HTTP_METHOD = "/http/method".freeze
        HTTP_REDIRECTED_URL = "/http/redirected_url".freeze
        HTTP_REQUEST_SIZE = "/http/request/size".freeze
        HTTP_RESPONSE_SIZE = "/http/response/size".freeze
        HTTP_STATUS_CODE = "/http/status_code".freeze
        HTTP_URL = "/http/url".freeze
        HTTP_USER_AGENT = "/http/user_agent".freeze
        PID = "/pid".freeze
        STACKTRACE = "/stacktrace".freeze
        TID = "/tid".freeze

        GAE_APPLICATION_ERROR = "g.co/gae/application_error".freeze
        GAE_APP_MODULE = "g.co/gae/app/module".freeze
        GAE_APP_MODULE_VERSION = "g.co/gae/app/module_version".freeze
        GAE_APP_VERSION = "g.co/gae/app/version".freeze
        GAE_DATASTORE_COUNT = "g.co/gae/datastore/count".freeze
        GAE_DATASTORE_CURSOR = "g.co/gae/datastore/cursor".freeze
        GAE_DATASTORE_ENTITY_WRITES = "g.co/gae/datastore/entity_writes".freeze
        GAE_DATASTORE_HAS_ANCESTOR = "g.co/gae/datastore/has_ancestor".freeze
        GAE_DATASTORE_HAS_CURSOR = "g.co/gae/datastore/has_cursor".freeze
        GAE_DATASTORE_HAS_TRANSACTION =
          "g.co/gae/datastore/has_transaction".freeze
        GAE_DATASTORE_INDEX_WRITES = "g.co/gae/datastore/index_writes".freeze
        GAE_DATASTORE_KIND = "g.co/gae/datastore/kind".freeze
        GAE_DATASTORE_LIMIT = "g.co/gae/datastore/limit".freeze
        GAE_DATASTORE_MORE_RESULTS = "g.co/gae/datastore/more_results".freeze
        GAE_DATASTORE_OFFSET = "g.co/gae/datastore/offset".freeze
        GAE_DATASTORE_REQUESTED_ENTITY_DELETES =
          "g.co/gae/datastore/requested_entity_deletes".freeze
        GAE_DATASTORE_REQUESTED_ENTITY_PUTS =
          "g.co/gae/datastore/requested_entity_puts".freeze
        GAE_DATASTORE_SIZE = "g.co/gae/datastore/size".freeze
        GAE_DATASTORE_SKIPPED = "g.co/gae/datastore/skipped".freeze
        GAE_DATASTORE_TRANSACTION_HANDLE =
          "g.co/gae/datastore/transaction_handle".freeze
        GAE_ERROR_MESSAGE = "g.co/gae/error_message".freeze
        GAE_MEMCACHE_COUNT = "g.co/gae/memcache/count".freeze
        GAE_MEMCACHE_SIZE = "g.co/gae/memcache/size".freeze
        GAE_REQUEST_LOG_ID = "g.co/gae/request_log_id".freeze

        RPC_HOST = "/rpc/host".freeze
        RPC_REQUEST_TYPE = "/rpc/request/type".freeze
        RPC_REQUEST_SIZE = "/rpc/request/size".freeze
        RPC_RESPONSE_SIZE = "/rpc/response/size".freeze
        RPC_STATUS_CODE = "/rpc/status_code".freeze

        ##
        # Set the stack trace label in the given labels hash. The current call
        # stack is formatted so the Stackdriver UI will display it.
        #
        # @param [Hash] labels The labels hash in which to set the stack trace
        #     label value.
        # @param [Array<Thread::Backtrace::Location>] stack_frames The current
        #     caller stack as returned from `::Kernel.caller_locations`. If
        #     not set, `::Kernel.caller_locations` is called internally.
        # @param [Integer] skip_frames Passed to the internal invocation of
        #     `::Kernel.caller_locations` if one is needed.
        # @param [Proc] truncate_stack A procedure that allows skipping of
        #     the "topmost" stack frames. Stack frames, represented by
        #     instances of `Thread::Backtrace::Location`, are passed to this
        #     proc beginning with the topmost frame. As long as the proc
        #     returns a falsy value, those frames are dropped. Once the proc
        #     returns true for the first time, that frame and all remaining
        #     frames (possibly subject to `filter_stack`) are used. If not set,
        #     no frames are skipped.
        # @param [Proc] filter_stack A procedure that allows skipping of
        #     stack frames in the middle of the stack trace. After possibly
        #     skipping frames using `truncate_stack`, all remaining frames are
        #     passed to this proc as `Thread::Backtrace::Location` objects.
        #     Those for whom the proc returns a falsy value are skipped. If
        #     this parameter is not set, no filtering is done and all frames
        #     are presented in the stack trace.
        #
        # @example
        #   require "google/cloud/trace"
        #
        #   trace_record = Google::Cloud::Trace::TraceRecord.new "my-project"
        #   span = trace_record.create_span "root_span"
        #   Google::Cloud::Trace::LabelKey.set_stack_trace span.labels
        #
        def self.set_stack_trace labels,
                                 stack_frames: nil, skip_frames: 1,
                                 truncate_stack: nil, filter_stack: nil
          stack_frames ||= ::Kernel.caller_locations skip_frames
          json_frames = []
          collecting_frames = !truncate_stack
          stack_frames.each do |frame|
            collecting_frames ||= truncate_stack.call(frame)
            next unless collecting_frames
            next unless !filter_stack || filter_stack.call(frame)
            json_frames <<
              {
                file_name: frame.absolute_path,
                line_number: frame.lineno,
                method_name: frame.label
              }
          end
          json_object = { stack_frame: json_frames }
          labels[STACKTRACE] = JSON.generate json_object
        end
      end
    end
  end
end
