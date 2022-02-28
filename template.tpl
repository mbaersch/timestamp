___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Timestamp",
  "description": "returns a current timestamp (optionally including milliseconds or additional zeros to generate a microseconds timestamp).",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "SELECT",
    "name": "outputFormat",
    "displayName": "Output Format",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "sec",
        "displayValue": "Seconds"
      },
      {
        "value": "milli",
        "displayValue": "Milliseconds"
      },
      {
        "value": "micro",
        "displayValue": "Microseconds"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "milli",
    "help": "Define length of timestamp. Note: precision only includes milliseconds. A Timestamp with microseconds format will always have 000 as last digits."
  }
]


___SANDBOXED_JS_FOR_SERVER___

const ts = require("getTimestampMillis");

var t = ts();
if (data.outputFormat === "sec") t = require("Math").round(t / 1000); 
else if (data.outputFormat === "micro") t = t * 1000;

return t;


___TESTS___

scenarios:
- name: testSeconds
  code: |-
    const mockData = {
      outputFormat: "sec"
    };

    // Call runCode to run the template's code.
    let variableResult = runCode(mockData);

    // Verify that the variable returns a result.
    assertThat(require("makeString")(variableResult)).hasLength(10);
- name: testMillis
  code: |-
    const mockData = {
      outputFormat: "milli"
    };

    // Call runCode to run the template's code.
    let variableResult = runCode(mockData);

    // Verify that the variable returns a result.
    assertThat(require("makeString")(variableResult)).hasLength(13);
- name: testMicros
  code: |-
    const mockData = {
      outputFormat: "micro"
    };

    // Call runCode to run the template's code.
    let variableResult = runCode(mockData);

    // Verify that the variable returns a result.
    assertThat(require("makeString")(variableResult)).hasLength(16);


___NOTES___

Created on 28.2.2022, 22:03:43


