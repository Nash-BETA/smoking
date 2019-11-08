# Release History

### 0.33.1 / 2019-11-06

#### Bug Fixes

* Update minimum runtime dependencies

### 0.33.0 / 2019-10-29

This release requires Ruby 2.4 or later.

#### Documentation

* Clarify which Google Cloud Platform environments support automatic authentication

### 0.32.1 / 2019-10-10

#### Bug Fixes

* The ErrorReporting middleware reuses the existing default reporter instead of creating new ones every time

### 0.32.0 / 2019-08-23

#### Features

* Support overriding of service endpoint

#### Documentation

* Update documentation

### 0.31.7 / 2019-07-31

* Fix max threads setting in thread pools
  * Thread pools once again limit the number of threads allocated.
* Update documentation links

### 0.31.6 / 2019-07-08

* Support overriding service host and port in the low-level interface.

### 0.31.5 / 2019-06-11

* Use VERSION constant in GAPIC client

### 0.31.4 / 2019-04-29

* Add AUTHENTICATION.md guide.
* Update documentation for common types.
* Update generated code examples.
* Extract gRPC header values from request.

### 0.31.3 / 2019-02-13

* Fix bug (typo) in retrieving default on_error proc.

### 0.31.2 / 2019-02-09

* Fix conversion code for ErrorEvent and Debugee.
  * Prepare for changes in JSON serialization coming in
    google-protobuf 3.7.

### 0.31.1 / 2019-02-07

* Update concurrent-ruby dependency

### 0.31.0 / 2019-02-01

* Add ErrorReporting on_error configuration.
* Update asynchronous error reporting implementation:
  * Add dependency on concurrent-ruby.
* Fix for submitting error objects without backtrace.
* Make use of Credentials#project_id
  * Use Credentials#project_id
    If a project_id is not provided, use the value on the Credentials object.
    This value was added in googleauth 0.7.0.
  * Loosen googleauth dependency
    Allow for new releases up to 0.10.
    The googleauth devs have committed to maintaining the current API
    and will not make backwards compatible changes before 0.10.

### 0.30.5 / 2018-09-20

* Update documentation.
  * Change documentation URL to googleapis GitHub org.
* Fix circular require warning.

### 0.30.4 / 2018-09-12

* Add missing documentation files to package.

### 0.30.3 / 2018-09-10

* Update documentation.

### 0.30.2 / 2018-08-21

* Update documentation.

### 0.30.1 / 2018-07-05

* Fix undefined method for nil error when error object has empty backtrace.
* Fix issue when disabling Stackdriver components with Rails.env.production.
* Capture env["rack.exception"] errors from Rack env.
* Add documentation for enabling gRPC logging.

### 0.30.0 / 2018-02-27

* Use Google Cloud Shared Configuration.

### 0.29.0 / 2017-12-19

* Update google-gax dependency to 1.0.

### 0.28.1 / 2017-11-15

* Fix credentials verification bug in Railtie.

### 0.28.0 / 2017-11-14

* Add `Google::Cloud::ErrorReporting::Credentials` class.
* Rename constructor arguments to `project_id` and `credentials`.
  (The previous arguments `project` and `keyfile` are still supported.)
* Document `Google::Auth::Credentials` as `credentials` value.
* Updated `google-gax` (`grpc`, `google-protobuf`), `googleauth` dependencies.

### 0.27.0 / 2017-09-08

* Rename `module_name` and `module_version` parameters to `service_name` and `service_version` respectively.
* Print captured exception from asynchronous worker thread.

### 0.26.1 / 2017-07-11

* stackdriver-core 1.2.0 release

### 0.26.0 / 2017-07-11

* Update `Google::Cloud::ErrorReporting::Middleware` and `Google::Cloud::ErrorReporting::Railtie` to submit error events asynchronously by default.
* Update GAPIC configuration to exclude `UNAVAILABLE` errors from automatic retry.

### 0.25.0 / 2017-05-25

* New Error Reporting instrumentation client.
* Introduce simple `Google::Cloud::ErrorReporting.report` interface to easily report Ruby exception.
* New `Google::Cloud::ErrorReporting.configure` instrumentation configuration interface.
* `Google::Cloud::ErrorReporting::Middleware` can now be used without required parameters.

### 0.24.0 / 2017-03-31

* Automatic retry on `UNAVAILABLE` errors

### 0.23.3 / 2017-03-03

* Update GRPC header value sent to the Error Reporting API.

### 0.23.2 / 2017-03-01

* Update GRPC header value sent to the Error Reporting API.

### 0.23.1 / 2017-02-23

* Add middleware require to rails module (premist)

### 0.23.0 / 2017-02-21

* Fix GRPC retry bug
* The client_config data structure has replaced retry_codes/retry_codes_def with retry_codes
* Update GRPC/Protobuf/GAX dependencies

### 0.22.0 / 2017-01-27

* Update Error Reporting requires. For Rack integration, users now need to use
  `require "google/cloud/error_reporting/middleware"` rather than
  `require "google/cloud/error_reporting/v1beta1"`.
* Change class names in low-level API (GAPIC)

### 0.21.2 / 2016-11-03

* Fixed instrumentation integration with Ruby on Rails

### 0.21.1 / 2016-11-01

* Fixed instrumentation integration with non-Rails Rack frameworks

### 0.21.0 / 2016-10-20

* First release
