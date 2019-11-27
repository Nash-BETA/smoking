# Copyright 2016 Google LLC
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


require "google/cloud/logging/sink/list"

module Google
  module Cloud
    module Logging
      ##
      # # Sink
      #
      # Used to export log entries outside Stackdriver Logging. When you create
      # a sink, new log entries are exported. Stackdriver Logging does not send
      # previously-ingested log entries to the sink's destination.
      #
      # A logs filter controls which log entries are exported. Sinks can have a
      # start time and an end time; these can be used to place log entries from
      # an exact time range into a particular destination.  If both `start_at`
      # and `end_at` are present, then `start_at` must be less than `end_at`.
      #
      # Before creating the sink, ensure that you have granted
      # `cloud-logs@google.com` permission to write logs to the destination. See
      # [Permissions for writing exported
      # logs](https://cloud.google.com/logging/docs/export/configure_export#setting_product_name_short_permissions_for_writing_exported_logs).
      #
      # You can retrieve an existing sink with {Project#sink}.
      #
      # @see https://cloud.google.com/logging/docs/api/tasks/exporting-logs
      #   Exporting Logs With Sinks
      # @see https://cloud.google.com/logging/docs/api/introduction_v2#kinds_of_log_sinks
      #   Kinds of log sinks (API V2)
      # @see https://cloud.google.com/logging/docs/api/#sinks Sinks (API V1)
      # @see https://cloud.google.com/logging/docs/export/configure_export#setting_product_name_short_permissions_for_writing_exported_logs
      #   Permissions for writing exported logs
      #
      # @example
      #   require "google/cloud/storage"
      #
      #   storage = Google::Cloud::Storage.new
      #   bucket = storage.create_bucket "my-logs-bucket"
      #
      #   # Grant owner permission to Stackdriver Logging service
      #   email = "cloud-logs@google.com"
      #   bucket.acl.add_owner "group-#{email}"
      #
      #   require "google/cloud/logging"
      #
      #   logging = Google::Cloud::Logging.new
      #   sink = logging.create_sink "my-sink",
      #                              "storage.googleapis.com/#{bucket.id}"
      #
      class Sink
        ##
        # @private The gRPC Service object.
        attr_accessor :service

        ##
        # @private The Google API Client object.
        attr_accessor :grpc

        ##
        # @private Create an empty Sink object.
        def initialize
          @service = nil
          @grpc = Google::Logging::V2::LogSink.new
        end

        ##
        # The client-assigned sink identifier. Sink identifiers are limited to
        # 1000 characters and can include only the following characters: `A-Z`,
        # `a-z`, `0-9`, and the special characters `_-.`.
        def name
          @grpc.name
        end

        ##
        # The export destination. See [Exporting Logs With
        # Sinks](https://cloud.google.com/logging/docs/api/tasks/exporting-logs).
        def destination
          @grpc.destination
        end

        ##
        # Updates the export destination. See [Exporting Logs With
        # Sinks](https://cloud.google.com/logging/docs/api/tasks/exporting-logs).
        def destination= destination
          @grpc.destination = destination
        end

        ##
        # An [advanced logs
        # filter](https://cloud.google.com/logging/docs/view/advanced_filters)
        # that defines the log entries to be exported. The filter must be
        # consistent with the log entry format designed by the `version`
        # parameter, regardless of the format of the log entry that was
        # originally written to Stackdriver Logging.
        def filter
          @grpc.filter
        end

        ##
        # Updates the [advanced logs
        # filter](https://cloud.google.com/logging/docs/view/advanced_filters)
        # that defines the log entries to be exported. The filter must be
        # consistent with the log entry format designed by the `version`
        # parameter, regardless of the format of the log entry that was
        # originally written to Stackdriver Logging.
        def filter= filter
          @grpc.filter = filter
        end

        ##
        # **Deprecated.** The log entry version used when exporting log entries
        # from this sink. This version does not have to correspond to the
        # version of the log entry when it was written to Stackdriver Logging.
        #
        # @deprecated The v2 format is used by default and cannot be changed.
        def version
          warn "[DEPRECATION] version is deprecated."
          :V2
        end

        ##
        # **Deprecated.** Updates the log entry version used when exporting log
        # entries from this sink. This version does not have to correspond to
        # the version of the log entry when it was written to Stackdriver
        # Logging. Accepted values are `:VERSION_FORMAT_UNSPECIFIED`, `:V2`, and
        # `:V1`.
        #
        # @deprecated The v2 format is used by default and cannot be changed.
        def version= _version
          warn "[DEPRECATION] version= is deprecated and will be ignored."
        end

        ##
        # Helper to determine if the sink's version is
        # `VERSION_FORMAT_UNSPECIFIED`.
        #
        # @deprecated The v2 format is used by default and cannot be changed.
        def unspecified?
          warn "[DEPRECATION] unspecified? is deprecated."
          false
        end

        ##
        # Helper to determine if the sink's version is `V2`.
        #
        # @deprecated The v2 format is used by default and cannot be changed.
        def v2?
          warn "[DEPRECATION] v2? is deprecated."
          true
        end

        ##
        # Helper to determine if the sink's version is `V1`.
        #
        # @deprecated The v2 format is used by default and cannot be changed.
        def v1?
          warn "[DEPRECATION] v1? is deprecated."
          false
        end

        ##
        # **Deprecated.** The time at which this sink will begin exporting log
        # entries. If this value is present, then log entries are exported only
        # if `start_at` is less than the log entry's timestamp. Optional.
        #
        # @deprecated This field is ignored when creating or updating sinks.
        def start_at
          warn "[DEPRECATION] start_at is deprecated."
          nil
        end
        alias start_time start_at

        ##
        # **Deprecated.** Sets the time at which this sink will begin exporting
        # log entries. If this value is present, then log entries are exported
        # only if `start_at` is less than the log entry's timestamp. Optional.
        #
        # @deprecated This field is ignored when creating or updating sinks.
        def start_at= _new_start_at
          warn "[DEPRECATION] start_at= is deprecated and will be ignored."
        end
        alias start_time= start_at=

        ##
        # **Deprecated.** Time at which this sink will stop exporting log
        # entries. If this value is present, then log entries are exported only
        # if the log entry's timestamp is less than `end_at`. Optional.
        #
        # @deprecated This field is ignored when creating or updating sinks.
        def end_at
          warn "[DEPRECATION] end_at is deprecated."
          nil
        end
        alias end_time end_at

        ##
        # **Deprecated.** Sets the time at which this sink will stop exporting
        # log entries. If this value is present, then log entries are exported
        # only if the log entry's timestamp is less than `end_at`. Optional.
        #
        # @deprecated This field is ignored when creating or updating sinks.
        def end_at= _new_end_at
          warn "[DEPRECATION] end_at= is deprecated and will be ignored."
        end
        alias end_time= end_at=

        ##
        # An IAM identity (a service account or group) that will write exported
        # log entries to the destination on behalf of Stackdriver Logging. You
        # must grant this identity write-access to the destination. Consult the
        # destination service's documentation to determine the exact role that
        # must be granted.
        def writer_identity
          @grpc.writer_identity
        end

        ##
        # Updates the logs-based sink.
        #
        # @param [Boolean] unique_writer_identity Whether the sink will have a
        #    dedicated service account returned in the sink's `writer_identity`.
        #    Set this field to be true to export logs from one project to a
        #    different project. This field is ignored for non-project sinks
        #    (e.g. organization sinks) because those sinks are required to have
        #    dedicated service accounts. Optional.
        #
        # @example
        #   require "google/cloud/logging"
        #
        #   logging = Google::Cloud::Logging.new
        #   sink = logging.sink "severe_errors"
        #   sink.filter = "logName:syslog AND severity>=ERROR"
        #   sink.save
        #
        def save unique_writer_identity: nil
          ensure_service!
          @grpc = service.update_sink \
            name, destination, filter,
            unique_writer_identity: unique_writer_identity
        end

        ##
        # Reloads the logs-based sink with current data from the Logging
        # service.
        def reload!
          ensure_service!
          @grpc = service.get_sink name
        end
        alias refresh! reload!

        ##
        # Permanently deletes the logs-based sink.
        #
        # @return [Boolean] Returns `true` if the sink was deleted.
        #
        # @example
        #   require "google/cloud/logging"
        #
        #   logging = Google::Cloud::Logging.new
        #   sink = logging.sink "severe_errors"
        #   sink.delete
        #
        def delete
          ensure_service!
          service.delete_sink name
          true
        end

        ##
        # @private New Sink from a Google::Logging::V2::LogSink object.
        def self.from_grpc grpc, service
          new.tap do |f|
            f.grpc = grpc
            f.service = service
          end
        end

        protected

        ##
        # @private Raise an error unless an active connection to the service is
        # available.
        def ensure_service!
          raise "Must have active connection to service" unless service
        end

        ##
        # @private Get a Google::Protobuf::Timestamp object from a Time object.
        def time_to_timestamp time
          return nil if time.nil?
          # Make sure we have a Time object
          return nil unless time.respond_to? :to_time
          time = time.to_time
          Google::Protobuf::Timestamp.new seconds: time.to_i, nanos: time.nsec
        end

        ##
        # @private Get a Time object from a Google::Protobuf::Timestamp object.
        def timestamp_to_time timestamp
          return nil if timestamp.nil?
          # Time.at takes microseconds, so convert nano seconds to microseconds
          Time.at timestamp.seconds, Rational(timestamp.nanos, 1000)
        end
      end
    end
  end
end
