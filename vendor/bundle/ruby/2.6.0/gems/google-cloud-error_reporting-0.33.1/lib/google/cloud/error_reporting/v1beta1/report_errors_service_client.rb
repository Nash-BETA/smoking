# Copyright 2019 Google LLC
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
#
# EDITING INSTRUCTIONS
# This file was generated from the file
# https://github.com/googleapis/googleapis/blob/master/google/devtools/clouderrorreporting/v1beta1/report_errors_service.proto,
# and updates to that file get reflected here through a refresh process.
# For the short term, the refresh process will only be runnable by Google
# engineers.


require "json"
require "pathname"

require "google/gax"

require "google/devtools/clouderrorreporting/v1beta1/report_errors_service_pb"
require "google/cloud/error_reporting/v1beta1/credentials"
require "google/cloud/error_reporting/version"

module Google
  module Cloud
    module ErrorReporting
      module V1beta1
        # An API for reporting error events.
        #
        # @!attribute [r] report_errors_service_stub
        #   @return [Google::Devtools::Clouderrorreporting::V1beta1::ReportErrorsService::Stub]
        class ReportErrorsServiceClient
          # @private
          attr_reader :report_errors_service_stub

          # The default address of the service.
          SERVICE_ADDRESS = "clouderrorreporting.googleapis.com".freeze

          # The default port of the service.
          DEFAULT_SERVICE_PORT = 443

          # The default set of gRPC interceptors.
          GRPC_INTERCEPTORS = []

          DEFAULT_TIMEOUT = 30

          # The scopes needed to make gRPC calls to all of the methods defined in
          # this service.
          ALL_SCOPES = [
            "https://www.googleapis.com/auth/cloud-platform"
          ].freeze


          PROJECT_PATH_TEMPLATE = Google::Gax::PathTemplate.new(
            "projects/{project}"
          )

          private_constant :PROJECT_PATH_TEMPLATE

          # Returns a fully-qualified project resource name string.
          # @param project [String]
          # @return [String]
          def self.project_path project
            PROJECT_PATH_TEMPLATE.render(
              :"project" => project
            )
          end

          # @param credentials [Google::Auth::Credentials, String, Hash, GRPC::Core::Channel, GRPC::Core::ChannelCredentials, Proc]
          #   Provides the means for authenticating requests made by the client. This parameter can
          #   be many types.
          #   A `Google::Auth::Credentials` uses a the properties of its represented keyfile for
          #   authenticating requests made by this client.
          #   A `String` will be treated as the path to the keyfile to be used for the construction of
          #   credentials for this client.
          #   A `Hash` will be treated as the contents of a keyfile to be used for the construction of
          #   credentials for this client.
          #   A `GRPC::Core::Channel` will be used to make calls through.
          #   A `GRPC::Core::ChannelCredentials` for the setting up the RPC client. The channel credentials
          #   should already be composed with a `GRPC::Core::CallCredentials` object.
          #   A `Proc` will be used as an updater_proc for the Grpc channel. The proc transforms the
          #   metadata for requests, generally, to give OAuth credentials.
          # @param scopes [Array<String>]
          #   The OAuth scopes for this service. This parameter is ignored if
          #   an updater_proc is supplied.
          # @param client_config [Hash]
          #   A Hash for call options for each method. See
          #   Google::Gax#construct_settings for the structure of
          #   this data. Falls back to the default config if not specified
          #   or the specified config is missing data points.
          # @param timeout [Numeric]
          #   The default timeout, in seconds, for calls made through this client.
          # @param metadata [Hash]
          #   Default metadata to be sent with each request. This can be overridden on a per call basis.
          # @param service_address [String]
          #   Override for the service hostname, or `nil` to leave as the default.
          # @param service_port [Integer]
          #   Override for the service port, or `nil` to leave as the default.
          # @param exception_transformer [Proc]
          #   An optional proc that intercepts any exceptions raised during an API call to inject
          #   custom error handling.
          def initialize \
              credentials: nil,
              scopes: ALL_SCOPES,
              client_config: {},
              timeout: DEFAULT_TIMEOUT,
              metadata: nil,
              service_address: nil,
              service_port: nil,
              exception_transformer: nil,
              lib_name: nil,
              lib_version: ""
            # These require statements are intentionally placed here to initialize
            # the gRPC module only when it's required.
            # See https://github.com/googleapis/toolkit/issues/446
            require "google/gax/grpc"
            require "google/devtools/clouderrorreporting/v1beta1/report_errors_service_services_pb"

            credentials ||= Google::Cloud::ErrorReporting::V1beta1::Credentials.default

            if credentials.is_a?(String) || credentials.is_a?(Hash)
              updater_proc = Google::Cloud::ErrorReporting::V1beta1::Credentials.new(credentials).updater_proc
            end
            if credentials.is_a?(GRPC::Core::Channel)
              channel = credentials
            end
            if credentials.is_a?(GRPC::Core::ChannelCredentials)
              chan_creds = credentials
            end
            if credentials.is_a?(Proc)
              updater_proc = credentials
            end
            if credentials.is_a?(Google::Auth::Credentials)
              updater_proc = credentials.updater_proc
            end

            package_version = Google::Cloud::ErrorReporting::VERSION

            google_api_client = "gl-ruby/#{RUBY_VERSION}"
            google_api_client << " #{lib_name}/#{lib_version}" if lib_name
            google_api_client << " gapic/#{package_version} gax/#{Google::Gax::VERSION}"
            google_api_client << " grpc/#{GRPC::VERSION}"
            google_api_client.freeze

            headers = { :"x-goog-api-client" => google_api_client }
            headers.merge!(metadata) unless metadata.nil?
            client_config_file = Pathname.new(__dir__).join(
              "report_errors_service_client_config.json"
            )
            defaults = client_config_file.open do |f|
              Google::Gax.construct_settings(
                "google.devtools.clouderrorreporting.v1beta1.ReportErrorsService",
                JSON.parse(f.read),
                client_config,
                Google::Gax::Grpc::STATUS_CODE_NAMES,
                timeout,
                errors: Google::Gax::Grpc::API_ERRORS,
                metadata: headers
              )
            end

            # Allow overriding the service path/port in subclasses.
            service_path = service_address || self.class::SERVICE_ADDRESS
            port = service_port || self.class::DEFAULT_SERVICE_PORT
            interceptors = self.class::GRPC_INTERCEPTORS
            @report_errors_service_stub = Google::Gax::Grpc.create_stub(
              service_path,
              port,
              chan_creds: chan_creds,
              channel: channel,
              updater_proc: updater_proc,
              scopes: scopes,
              interceptors: interceptors,
              &Google::Devtools::Clouderrorreporting::V1beta1::ReportErrorsService::Stub.method(:new)
            )

            @report_error_event = Google::Gax.create_api_call(
              @report_errors_service_stub.method(:report_error_event),
              defaults["report_error_event"],
              exception_transformer: exception_transformer,
              params_extractor: proc do |request|
                {'project_name' => request.project_name}
              end
            )
          end

          # Service calls

          # Report an individual error event.
          #
          # This endpoint accepts <strong>either</strong> an OAuth token,
          # <strong>or</strong> an
          # <a href="https://support.google.com/cloud/answer/6158862">API key</a>
          # for authentication. To use an API key, append it to the URL as the value of
          # a `key` parameter. For example:
          # <pre>POST
          # https://clouderrorreporting.googleapis.com/v1beta1/projects/example-project/events:report?key=123ABC456</pre>
          #
          # @param project_name [String]
          #   [Required] The resource name of the Google Cloud Platform project. Written
          #   as `projects/` plus the
          #   [Google Cloud Platform project
          #   ID](https://support.google.com/cloud/answer/6158840). Example:
          #   `projects/my-project-123`.
          # @param event [Google::Devtools::Clouderrorreporting::V1beta1::ReportedErrorEvent | Hash]
          #   [Required] The error event to be reported.
          #   A hash of the same form as `Google::Devtools::Clouderrorreporting::V1beta1::ReportedErrorEvent`
          #   can also be provided.
          # @param options [Google::Gax::CallOptions]
          #   Overrides the default settings for this call, e.g, timeout,
          #   retries, etc.
          # @yield [result, operation] Access the result along with the RPC operation
          # @yieldparam result [Google::Devtools::Clouderrorreporting::V1beta1::ReportErrorEventResponse]
          # @yieldparam operation [GRPC::ActiveCall::Operation]
          # @return [Google::Devtools::Clouderrorreporting::V1beta1::ReportErrorEventResponse]
          # @raise [Google::Gax::GaxError] if the RPC is aborted.
          # @example
          #   require "google/cloud/error_reporting"
          #
          #   report_errors_client = Google::Cloud::ErrorReporting::ReportErrors.new(version: :v1beta1)
          #   formatted_project_name = Google::Cloud::ErrorReporting::V1beta1::ReportErrorsServiceClient.project_path("[PROJECT]")
          #
          #   # TODO: Initialize `event`:
          #   event = {}
          #   response = report_errors_client.report_error_event(formatted_project_name, event)

          def report_error_event \
              project_name,
              event,
              options: nil,
              &block
            req = {
              project_name: project_name,
              event: event
            }.delete_if { |_, v| v.nil? }
            req = Google::Gax::to_proto(req, Google::Devtools::Clouderrorreporting::V1beta1::ReportErrorEventRequest)
            @report_error_event.call(req, options, &block)
          end
        end
      end
    end
  end
end
