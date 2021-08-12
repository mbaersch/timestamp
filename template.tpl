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
  "description": "returns a current timestamp (optionally including milliseconds).",
  "categories": ["UTILITY"],
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "CHECKBOX",
    "name": "optMillis",
    "checkboxText": "Include Milliseconds",
    "simpleValueType": true,
    "defaultValue": true
  }
]


___SANDBOXED_JS_FOR_SERVER___

const ts = require("getTimestampMillis");
const Math = require("Math");

var t = ts();
if (!data.optMillis) t = Math.round(t / 1000);
return t;


___TESTS___

scenarios: []


___NOTES___

Created on 12.8.2021, 15:35:24