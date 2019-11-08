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


module Google
  module Logging
    module V2
      # Describes a sink used to export log entries to one of the following
      # destinations in any project: a Cloud Storage bucket, a BigQuery dataset, or a
      # Cloud Pub/Sub topic. A logs filter controls which log entries are exported.
      # The sink must be created within a project, organization, billing account, or
      # folder.
      # @!attribute [rw] name
      #   @return [String]
      #     Required. The client-assigned sink identifier, unique within the
      #     project. Example: `"my-syslog-errors-to-pubsub"`. Sink identifiers are
      #     limited to 100 characters and can include only the following characters:
      #     upper and lower-case alphanumeric characters, underscores, hyphens, and
      #     periods.
      # @!attribute [rw] destination
      #   @return [String]
      #     Required. The export destination:
      #
      #         "storage.googleapis.com/[GCS_BUCKET]"
      #         "bigquery.googleapis.com/projects/[PROJECT_ID]/datasets/[DATASET]"
      #         "pubsub.googleapis.com/projects/[PROJECT_ID]/topics/[TOPIC_ID]"
      #
      #     The sink's `writer_identity`, set when the sink is created, must
      #     have permission to write to the destination or else the log
      #     entries are not exported. For more information, see
      #     [Exporting Logs with Sinks](https://cloud.google.com/logging/docs/api/tasks/exporting-logs).
      # @!attribute [rw] filter
      #   @return [String]
      #     Optional. An [advanced logs filter](https://cloud.google.com/logging/docs/view/advanced-queries). The only
      #     exported log entries are those that are in the resource owning the sink and
      #     that match the filter. For example:
      #
      #         logName="projects/[PROJECT_ID]/logs/[LOG_ID]" AND severity>=ERROR
      # @!attribute [rw] output_version_format
      #   @return [Google::Logging::V2::LogSink::VersionFormat]
      #     Deprecated. The log entry format to use for this sink's exported log
      #     entries. The v2 format is used by default and cannot be changed.
      # @!attribute [rw] writer_identity
      #   @return [String]
      #     Output only. An IAM identity&mdash;a service account or group&mdash;under
      #     which Logging writes the exported log entries to the sink's destination.
      #     This field is set by
      #     {Google::Logging::V2::ConfigServiceV2#create_sink}
      #     and
      #     {Google::Logging::V2::ConfigServiceV2#update_sink}
      #     based on the value of `unique_writer_identity` in those methods.
      #
      #     Until you grant this identity write-access to the destination, log entry
      #     exports from this sink will fail. For more information,
      #     see [Granting Access for a
      #     Resource](/iam/docs/granting-roles-to-service-accounts#granting_access_to_a_service_account_for_a_resource).
      #     Consult the destination service's documentation to determine the
      #     appropriate IAM roles to assign to the identity.
      # @!attribute [rw] include_children
      #   @return [true, false]
      #     Optional. This field applies only to sinks owned by organizations and
      #     folders. If the field is false, the default, only the logs owned by the
      #     sink's parent resource are available for export. If the field is true, then
      #     logs from all the projects, folders, and billing accounts contained in the
      #     sink's parent resource are also available for export. Whether a particular
      #     log entry from the children is exported depends on the sink's filter
      #     expression. For example, if this field is true, then the filter
      #     `resource.type=gce_instance` would export all Compute Engine VM instance
      #     log entries from all projects in the sink's parent. To only export entries
      #     from certain child projects, filter on the project part of the log name:
      #
      #         logName:("projects/test-project1/" OR "projects/test-project2/") AND
      #         resource.type=gce_instance
      # @!attribute [rw] bigquery_options
      #   @return [Google::Logging::V2::BigQueryOptions]
      #     Optional. Options that affect sinks exporting data to BigQuery.
      # @!attribute [rw] create_time
      #   @return [Google::Protobuf::Timestamp]
      #     Output only. The creation timestamp of the sink.
      #
      #     This field may not be present for older sinks.
      # @!attribute [rw] update_time
      #   @return [Google::Protobuf::Timestamp]
      #     Output only. The last update timestamp of the sink.
      #
      #     This field may not be present for older sinks.
      # @!attribute [rw] start_time
      #   @return [Google::Protobuf::Timestamp]
      #     Do not use. This field is ignored.
      # @!attribute [rw] end_time
      #   @return [Google::Protobuf::Timestamp]
      #     Do not use. This field is ignored.
      class LogSink
        # Available log entry formats. Log entries can be written to
        # Logging in either format and can be exported in either format.
        # Version 2 is the preferred format.
        module VersionFormat
          # An unspecified format version that will default to V2.
          VERSION_FORMAT_UNSPECIFIED = 0

          # `LogEntry` version 2 format.
          V2 = 1

          # `LogEntry` version 1 format.
          V1 = 2
        end
      end

      # Options that change functionality of a sink exporting data to BigQuery.
      # @!attribute [rw] use_partitioned_tables
      #   @return [true, false]
      #     Optional. Whether to use [BigQuery's partition
      #     tables](/bigquery/docs/partitioned-tables). By default, Logging
      #     creates dated tables based on the log entries' timestamps, e.g.
      #     syslog_20170523. With partitioned tables the date suffix is no longer
      #     present and [special query
      #     syntax](/bigquery/docs/querying-partitioned-tables) has to be used instead.
      #     In both cases, tables are sharded based on UTC timezone.
      class BigQueryOptions; end

      # The parameters to `ListSinks`.
      # @!attribute [rw] parent
      #   @return [String]
      #     Required. The parent resource whose sinks are to be listed:
      #
      #         "projects/[PROJECT_ID]"
      #         "organizations/[ORGANIZATION_ID]"
      #         "billingAccounts/[BILLING_ACCOUNT_ID]"
      #         "folders/[FOLDER_ID]"
      # @!attribute [rw] page_token
      #   @return [String]
      #     Optional. If present, then retrieve the next batch of results from the
      #     preceding call to this method. `pageToken` must be the value of
      #     `nextPageToken` from the previous response. The values of other method
      #     parameters should be identical to those in the previous call.
      # @!attribute [rw] page_size
      #   @return [Integer]
      #     Optional. The maximum number of results to return from this request.
      #     Non-positive values are ignored. The presence of `nextPageToken` in the
      #     response indicates that more results might be available.
      class ListSinksRequest; end

      # Result returned from `ListSinks`.
      # @!attribute [rw] sinks
      #   @return [Array<Google::Logging::V2::LogSink>]
      #     A list of sinks.
      # @!attribute [rw] next_page_token
      #   @return [String]
      #     If there might be more results than appear in this response, then
      #     `nextPageToken` is included. To get the next set of results, call the same
      #     method again using the value of `nextPageToken` as `pageToken`.
      class ListSinksResponse; end

      # The parameters to `GetSink`.
      # @!attribute [rw] sink_name
      #   @return [String]
      #     Required. The resource name of the sink:
      #
      #         "projects/[PROJECT_ID]/sinks/[SINK_ID]"
      #         "organizations/[ORGANIZATION_ID]/sinks/[SINK_ID]"
      #         "billingAccounts/[BILLING_ACCOUNT_ID]/sinks/[SINK_ID]"
      #         "folders/[FOLDER_ID]/sinks/[SINK_ID]"
      #
      #     Example: `"projects/my-project-id/sinks/my-sink-id"`.
      class GetSinkRequest; end

      # The parameters to `CreateSink`.
      # @!attribute [rw] parent
      #   @return [String]
      #     Required. The resource in which to create the sink:
      #
      #         "projects/[PROJECT_ID]"
      #         "organizations/[ORGANIZATION_ID]"
      #         "billingAccounts/[BILLING_ACCOUNT_ID]"
      #         "folders/[FOLDER_ID]"
      #
      #     Examples: `"projects/my-logging-project"`, `"organizations/123456789"`.
      # @!attribute [rw] sink
      #   @return [Google::Logging::V2::LogSink]
      #     Required. The new sink, whose `name` parameter is a sink identifier that
      #     is not already in use.
      # @!attribute [rw] unique_writer_identity
      #   @return [true, false]
      #     Optional. Determines the kind of IAM identity returned as `writer_identity`
      #     in the new sink. If this value is omitted or set to false, and if the
      #     sink's parent is a project, then the value returned as `writer_identity` is
      #     the same group or service account used by Logging before the addition of
      #     writer identities to this API. The sink's destination must be in the same
      #     project as the sink itself.
      #
      #     If this field is set to true, or if the sink is owned by a non-project
      #     resource such as an organization, then the value of `writer_identity` will
      #     be a unique service account used only for exports from the new sink. For
      #     more information, see `writer_identity` in {Google::Logging::V2::LogSink LogSink}.
      class CreateSinkRequest; end

      # The parameters to `UpdateSink`.
      # @!attribute [rw] sink_name
      #   @return [String]
      #     Required. The full resource name of the sink to update, including the
      #     parent resource and the sink identifier:
      #
      #         "projects/[PROJECT_ID]/sinks/[SINK_ID]"
      #         "organizations/[ORGANIZATION_ID]/sinks/[SINK_ID]"
      #         "billingAccounts/[BILLING_ACCOUNT_ID]/sinks/[SINK_ID]"
      #         "folders/[FOLDER_ID]/sinks/[SINK_ID]"
      #
      #     Example: `"projects/my-project-id/sinks/my-sink-id"`.
      # @!attribute [rw] sink
      #   @return [Google::Logging::V2::LogSink]
      #     Required. The updated sink, whose name is the same identifier that appears
      #     as part of `sink_name`.
      # @!attribute [rw] unique_writer_identity
      #   @return [true, false]
      #     Optional. See {Google::Logging::V2::ConfigServiceV2#create_sink}
      #     for a description of this field. When updating a sink, the effect of this
      #     field on the value of `writer_identity` in the updated sink depends on both
      #     the old and new values of this field:
      #
      #     * If the old and new values of this field are both false or both true,
      #       then there is no change to the sink's `writer_identity`.
      #     * If the old value is false and the new value is true, then
      #       `writer_identity` is changed to a unique service account.
      #     * It is an error if the old value is true and the new value is
      #       set to false or defaulted to false.
      # @!attribute [rw] update_mask
      #   @return [Google::Protobuf::FieldMask]
      #     Optional. Field mask that specifies the fields in `sink` that need
      #     an update. A sink field will be overwritten if, and only if, it is
      #     in the update mask. `name` and output only fields cannot be updated.
      #
      #     An empty updateMask is temporarily treated as using the following mask
      #     for backwards compatibility purposes:
      #       destination,filter,includeChildren
      #     At some point in the future, behavior will be removed and specifying an
      #     empty updateMask will be an error.
      #
      #     For a detailed `FieldMask` definition, see
      #     https://developers.google.com/protocol-buffers/docs/reference/google.protobuf#google.protobuf.FieldMask
      #
      #     Example: `updateMask=filter`.
      class UpdateSinkRequest; end

      # The parameters to `DeleteSink`.
      # @!attribute [rw] sink_name
      #   @return [String]
      #     Required. The full resource name of the sink to delete, including the
      #     parent resource and the sink identifier:
      #
      #         "projects/[PROJECT_ID]/sinks/[SINK_ID]"
      #         "organizations/[ORGANIZATION_ID]/sinks/[SINK_ID]"
      #         "billingAccounts/[BILLING_ACCOUNT_ID]/sinks/[SINK_ID]"
      #         "folders/[FOLDER_ID]/sinks/[SINK_ID]"
      #
      #     Example: `"projects/my-project-id/sinks/my-sink-id"`.
      class DeleteSinkRequest; end

      # Specifies a set of log entries that are not to be stored in
      # Logging. If your GCP resource receives a large volume of logs, you can
      # use exclusions to reduce your chargeable logs. Exclusions are
      # processed after log sinks, so you can export log entries before they are
      # excluded. Note that organization-level and folder-level exclusions don't
      # apply to child resources, and that you can't exclude audit log entries.
      # @!attribute [rw] name
      #   @return [String]
      #     Required. A client-assigned identifier, such as
      #     `"load-balancer-exclusion"`. Identifiers are limited to 100 characters and
      #     can include only letters, digits, underscores, hyphens, and periods.
      # @!attribute [rw] description
      #   @return [String]
      #     Optional. A description of this exclusion.
      # @!attribute [rw] filter
      #   @return [String]
      #     Required. An [advanced logs filter](https://cloud.google.com/logging/docs/view/advanced-queries)
      #     that matches the log entries to be excluded. By using the
      #     [sample function](https://cloud.google.com/logging/docs/view/advanced-queries#sample),
      #     you can exclude less than 100% of the matching log entries.
      #     For example, the following query matches 99% of low-severity log
      #     entries from Google Cloud Storage buckets:
      #
      #     `"resource.type=gcs_bucket severity<ERROR sample(insertId, 0.99)"`
      # @!attribute [rw] disabled
      #   @return [true, false]
      #     Optional. If set to True, then this exclusion is disabled and it does not
      #     exclude any log entries. You can [update an
      #     exclusion][google.logging.v2.ConfigServiceV2.UpdateExclusion] to change the
      #     value of this field.
      # @!attribute [rw] create_time
      #   @return [Google::Protobuf::Timestamp]
      #     Output only. The creation timestamp of the exclusion.
      #
      #     This field may not be present for older exclusions.
      # @!attribute [rw] update_time
      #   @return [Google::Protobuf::Timestamp]
      #     Output only. The last update timestamp of the exclusion.
      #
      #     This field may not be present for older exclusions.
      class LogExclusion; end

      # The parameters to `ListExclusions`.
      # @!attribute [rw] parent
      #   @return [String]
      #     Required. The parent resource whose exclusions are to be listed.
      #
      #         "projects/[PROJECT_ID]"
      #         "organizations/[ORGANIZATION_ID]"
      #         "billingAccounts/[BILLING_ACCOUNT_ID]"
      #         "folders/[FOLDER_ID]"
      # @!attribute [rw] page_token
      #   @return [String]
      #     Optional. If present, then retrieve the next batch of results from the
      #     preceding call to this method. `pageToken` must be the value of
      #     `nextPageToken` from the previous response. The values of other method
      #     parameters should be identical to those in the previous call.
      # @!attribute [rw] page_size
      #   @return [Integer]
      #     Optional. The maximum number of results to return from this request.
      #     Non-positive values are ignored. The presence of `nextPageToken` in the
      #     response indicates that more results might be available.
      class ListExclusionsRequest; end

      # Result returned from `ListExclusions`.
      # @!attribute [rw] exclusions
      #   @return [Array<Google::Logging::V2::LogExclusion>]
      #     A list of exclusions.
      # @!attribute [rw] next_page_token
      #   @return [String]
      #     If there might be more results than appear in this response, then
      #     `nextPageToken` is included. To get the next set of results, call the same
      #     method again using the value of `nextPageToken` as `pageToken`.
      class ListExclusionsResponse; end

      # The parameters to `GetExclusion`.
      # @!attribute [rw] name
      #   @return [String]
      #     Required. The resource name of an existing exclusion:
      #
      #         "projects/[PROJECT_ID]/exclusions/[EXCLUSION_ID]"
      #         "organizations/[ORGANIZATION_ID]/exclusions/[EXCLUSION_ID]"
      #         "billingAccounts/[BILLING_ACCOUNT_ID]/exclusions/[EXCLUSION_ID]"
      #         "folders/[FOLDER_ID]/exclusions/[EXCLUSION_ID]"
      #
      #     Example: `"projects/my-project-id/exclusions/my-exclusion-id"`.
      class GetExclusionRequest; end

      # The parameters to `CreateExclusion`.
      # @!attribute [rw] parent
      #   @return [String]
      #     Required. The parent resource in which to create the exclusion:
      #
      #         "projects/[PROJECT_ID]"
      #         "organizations/[ORGANIZATION_ID]"
      #         "billingAccounts/[BILLING_ACCOUNT_ID]"
      #         "folders/[FOLDER_ID]"
      #
      #     Examples: `"projects/my-logging-project"`, `"organizations/123456789"`.
      # @!attribute [rw] exclusion
      #   @return [Google::Logging::V2::LogExclusion]
      #     Required. The new exclusion, whose `name` parameter is an exclusion name
      #     that is not already used in the parent resource.
      class CreateExclusionRequest; end

      # The parameters to `UpdateExclusion`.
      # @!attribute [rw] name
      #   @return [String]
      #     Required. The resource name of the exclusion to update:
      #
      #         "projects/[PROJECT_ID]/exclusions/[EXCLUSION_ID]"
      #         "organizations/[ORGANIZATION_ID]/exclusions/[EXCLUSION_ID]"
      #         "billingAccounts/[BILLING_ACCOUNT_ID]/exclusions/[EXCLUSION_ID]"
      #         "folders/[FOLDER_ID]/exclusions/[EXCLUSION_ID]"
      #
      #     Example: `"projects/my-project-id/exclusions/my-exclusion-id"`.
      # @!attribute [rw] exclusion
      #   @return [Google::Logging::V2::LogExclusion]
      #     Required. New values for the existing exclusion. Only the fields specified
      #     in `update_mask` are relevant.
      # @!attribute [rw] update_mask
      #   @return [Google::Protobuf::FieldMask]
      #     Required. A non-empty list of fields to change in the existing exclusion.
      #     New values for the fields are taken from the corresponding fields in the
      #     {Google::Logging::V2::LogExclusion LogExclusion} included in this request. Fields not mentioned in
      #     `update_mask` are not changed and are ignored in the request.
      #
      #     For example, to change the filter and description of an exclusion,
      #     specify an `update_mask` of `"filter,description"`.
      class UpdateExclusionRequest; end

      # The parameters to `DeleteExclusion`.
      # @!attribute [rw] name
      #   @return [String]
      #     Required. The resource name of an existing exclusion to delete:
      #
      #         "projects/[PROJECT_ID]/exclusions/[EXCLUSION_ID]"
      #         "organizations/[ORGANIZATION_ID]/exclusions/[EXCLUSION_ID]"
      #         "billingAccounts/[BILLING_ACCOUNT_ID]/exclusions/[EXCLUSION_ID]"
      #         "folders/[FOLDER_ID]/exclusions/[EXCLUSION_ID]"
      #
      #     Example: `"projects/my-project-id/exclusions/my-exclusion-id"`.
      class DeleteExclusionRequest; end
    end
  end
end