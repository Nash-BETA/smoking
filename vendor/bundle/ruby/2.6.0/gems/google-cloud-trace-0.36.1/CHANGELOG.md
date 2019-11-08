# Release History

### 0.36.1 / 2019-11-06

#### Bug Fixes

* Update minimum runtime dependencies

### 0.36.0 / 2019-10-29

This release requires Ruby 2.4 or later.

#### Documentation

* Clarify which Google Cloud Platform environments support automatic authentication

### 0.35.0 / 2019-08-23

#### Features

* Support overriding of service endpoint

#### Documentation

* Update documentation

### 0.34.5 / 2019-07-31

* Fix max threads setting in thread pools
  * Thread pools once again limit the number of threads allocated.
* Update documentation links

### 0.34.4 / 2019-07-08

* Support overriding service host and port in the low-level interface.

### 0.34.3 / 2019-06-11

* Accept Numeric in Google::Cloud::Trace::Utils.time_to_grpc
* Add VERSION constant

### 0.34.2 / 2019-04-29

* Add AUTHENTICATION.md guide.
* Update generated documentation.
* Update generated code examples.
* Extract gRPC header values from request.

### 0.34.1 / 2019-02-13

* Fix bug (typo) in retrieving default on_error proc.

### 0.34.0 / 2019-02-07

* Add Trace `on_error` configuration.
* Middleware improvements:
  * Buffer traces and make batch API calls.
  * Back pressure is applied by limiting the number of queued API calls.
  * Errors will now be raised when there are not enough resources.
  * Errors are reported by calling the `on_error` callback.
* Make use of `Credentials#project_id`
  * Use `Credentials#project_id`
    If a `project_id` is not provided, use the value on the Credentials object.
    This value was added in googleauth 0.7.0.
  * Loosen googleauth dependency
    Allow for new releases up to 0.10.
    The googleauth devs have committed to maintaining the current API
    and will not make backwards compatible changes before 0.10.
* Update Trace documentation
  * Correct the C-code's comments.

### 0.33.6 / 2018-11-15

* Update network configuration.

### 0.33.5 / 2018-09-20

* Update documentation.
  * Change documentation URL to googleapis GitHub org.
* Fix circular require warning.

### 0.33.4 / 2018-09-12

* Add missing documentation files to package.

### 0.33.3 / 2018-09-10

* Update documentation.

### 0.33.2 / 2018-08-21

* Update documentation.

### 0.33.1 / 2018-07-05

* Fix issue when disabling Stackdriver components with Rails.env.production.
* Add /healthz to the ignored requests. (diegodurs)
* Add documentation for enabling gRPC logging.

### 0.33.0 / 2018-05-01

* Fix labels in Trace. (tareksamni)

### 0.31.0 / 2018-02-27

* Use Google Cloud Shared Configuration.
* Update authentication documentation.

### 0.30.0 / 2017-12-26

* Add `Google::Cloud::Trace::V2::TraceServiceClient` class.

### 0.29.0 / 2017-12-19

* Update google-gax dependency to 1.0.

### 0.28.1 / 2017-11-15

* Fix credentials verification bug in Railtie.

### 0.28.0 / 2017-11-14

* Add `Google::Cloud::Trace::Credentials` class.
* Rename constructor arguments to `project_id` and `credentials`.
  (The previous arguments `project` and `keyfile` are still supported.)
* Document `Google::Auth::Credentials` as `credentials` value.
* Update generated low level GAPIC code.
* Updated `google-gax` (`grpc`, `google-protobuf`), `googleauth` dependencies.

### 0.27.2 / 2017-09-20

* Fix the bug where `Google::Cloud::Trace::Middleware` wasn't using the shared `project_id` parameter.

### 0.27.1 / 2017-09-08

* Print captured exception from asynchronous worker thread.

### 0.27.0 / 2017-08-07

* Add instrumentation to collect outbound GRPC requests information.

### 0.26.1 / 2017-07-11

* stackdriver-core 1.2.0 release

### 0.26.0 / 2017-07-11

* Add Faraday Middleware to help collect outbound RPC information.
* Update `Google::Cloud::Trace::Middleware` and `Google::Cloud::Trace::Railtie` to submit trace spans asynchronously by default.
* Update GAPIC configuration to exclude `UNAVAILABLE` errors from automatic retry.

### 0.25.0 / 2017-05-25

* Introduce new `Google::Cloud::Trace.configure` instrumentation configuration interface.

### 0.24.1 / 2017-04-21

* If Rails integration fails due to an auth error, the notice is now printed to STDOUT rather than STDERR, which should make it a bit less scary when displayed in Docker output.

### 0.24.0 / 2017-03-31

* Updated documentation
* Automatic retry on `UNAVAILABLE` errors

### 0.23.2 / 2017-03-03

* Update GRPC header value sent to the Trace API.

### 0.23.1 / 2017-03-01

* Update GRPC header value sent to the Trace API.

### 0.23.0 / 2017-02-21

* Fix GRPC retry bug
* The client_config data structure has replaced retry_codes/retry_codes_def with retry_codes
* Update GRPC/Protobuf/GAX dependencies

### 0.22.0 / 2017-01-27

* Change class names in low-level API (GAPIC)

### 0.21.0 / 2016-12-22

* Initial release of google-cloud-trace, providing an API client and application instrumentation.
