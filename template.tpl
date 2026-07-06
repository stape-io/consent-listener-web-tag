___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Consent Listener Tag by Stape",
  "brand": {
    "id": "brand_dummy",
    "displayName": "stape.io",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAYAAABWzo5XAAABYElEQVR4AZ1TAUQFQRBdhBBCCCGEECCE8IEAkCT1b8ftdrt7oYAQ+gQIAUIA+AgQAoQQAgSAACGEcDjUPHag27vu32McNzNv386bVf9hrywXiGheDcWhtSvahGtt3Jc2/iPL/SVRudybYJy7TW6cctQxpjr3D/z94ag47sbGb7QTHPsdVvCMBqiAGqiSPBXFurbhNpJxTXgk60cNIk4+cXxmxp1iLqoFB0WxpK2/wGHoaSFCohtEZ4tSP5iIZ7ULJZjjQCIh8TXmiKv3IsLedJHE+jf+f98gggucfI+yeW+K7TYSAMbAxQSRu4KtWLq4Bt9YwhTJkSnXUKtzZ5pu2LCFpNgvOyUkiUNr2bPUnF5xLcwIzdq6m78kUAznGvNJqULRaDKZSzxgUVoR+VXVhcyEcyET90SJXDezbl/1AZ4AGuAiO3MSZ1JhLnyQVrMA9nPjCwjlkcqrHwRYLe504RfU6/XwKT3D8gAAAABJRU5ErkJggg\u003d\u003d"
  },
  "description": "This tag listens to updates in GTM consent and pushes it to the dataLayer or a custom named dataLayer.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "GROUP",
    "name": "configGroup",
    "displayName": "",
    "groupStyle": "NO_ZIPPY",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "useCustomDataLayer",
        "checkboxText": "Use custom dataLayer name",
        "simpleValueType": true,
        "subParams": [
          {
            "type": "LABEL",
            "name": "customDataLayerWarning",
            "displayName": "⚠️ \u003cb\u003eWARNING\u003c/b\u003e ⚠️ : If you use a custom named dataLayer, you will need to add a global variable permission (read/write)  within the template. Be aware that by doing so your template will unlink from the Community Gallery (unlinking it from the Gallery yields to not receiving any future updates for this template).",
            "enablingConditions": [
              {
                "paramName": "useCustomDataLayer",
                "paramValue": true,
                "type": "EQUALS"
              }
            ]
          },
          {
            "type": "TEXT",
            "name": "customDataLayerName",
            "displayName": "dataLayer name",
            "simpleValueType": true,
            "enablingConditions": [
              {
                "paramName": "useCustomDataLayer",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "defaultValue": "dataLayer"
          }
        ],
        "help": "Allows you to use a custom dataLayer name. Defaults to \u003cb\u003edataLayer\u003c/b\u003e. If you need a custom name, check the  warning below."
      },
      {
        "type": "CHECKBOX",
        "name": "customEventName",
        "checkboxText": "Use custom event name",
        "simpleValueType": true,
        "help": "Allows you to use a custom event name. Defaults to \u003cb\u003estape_consent_update\u003c/b\u003e.",
        "subParams": [
          {
            "type": "TEXT",
            "name": "eventName",
            "displayName": "Custom Event Name",
            "simpleValueType": true,
            "enablingConditions": [
              {
                "paramName": "customEventName",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "defaultValue": "stape_consent_update"
          }
        ]
      },
      {
        "type": "SIMPLE_TABLE",
        "name": "consentTypeTable",
        "displayName": "Consent Types",
        "simpleTableColumns": [
          {
            "defaultValue": "all_types",
            "displayName": "",
            "name": "consentType",
            "type": "SELECT",
            "selectItems": [
              {
                "value": "all_types",
                "displayValue": "All types"
              },
              {
                "value": "ad_storage",
                "displayValue": "Ad Storage"
              },
              {
                "value": "ad_user_data",
                "displayValue": "Ad User Data"
              },
              {
                "value": "ad_personalization",
                "displayValue": "Ad Personalization"
              },
              {
                "value": "analytics_storage",
                "displayValue": "Analytics Storage"
              },
              {
                "value": "functionality_storage",
                "displayValue": "Functionality Storage"
              },
              {
                "value": "personalization_storage",
                "displayValue": "Personalization Storage"
              },
              {
                "value": "security_storage",
                "displayValue": "Security Storage"
              }
            ],
            "isUnique": true,
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ]
          }
        ],
        "help": "Choose consent types to listen to. Defaults to \u003cb\u003eAll Types\u003c/b\u003e. \u003c/br\u003e\nCheck \u003ca href\u003d\u0027https://developers.google.com/tag-platform/security/concepts/consent-mode#consent-types\u0027 target\u003d\"_blank\"\u003e documentation \u003c/a\u003e for more details on each type of consent.",
        "newRowButtonText": "Add consent type"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const addConsentListener = require('addConsentListener');
const createQueue = require('createQueue');
const getUrl = require('getUrl');
const getType = require('getType');

/*==============================================================================
==============================================================================*/

if (shouldExitEarly()) return data.gtmOnSuccess();

const dataLayerName =
  data.useCustomDataLayer && data.customDataLayerName ? data.customDataLayerName : 'dataLayer';
const eventName = data.customEventName && data.eventName ? data.eventName : 'stape_consent_update';
const dataLayerDispatcher = createQueue(dataLayerName);
const typesToListen = getUserConsentTypesSelection(data);

addConsentStatusListener(typesToListen);

data.gtmOnSuccess();

/*==============================================================================
Helpers
==============================================================================*/

function shouldExitEarly() {
  const url = getUrl();
  const isConsentTableValidArray =
    getType(data.consentTypeTable) === 'array' && data.consentTypeTable.length > 0;

  if (url && url.lastIndexOf('https://gtm-msr.appspot.com/', 0) === 0) {
    return true;
  }
  if (!isConsentTableValidArray) {
    return true;
  }
  return false;
}

function getUserConsentTypesSelection(data) {
  const allTypesChosen = data.consentTypeTable.some(
    (consent) => consent.consentType === 'all_types'
  );

  const allConsentTypes = [
    'ad_storage',
    'ad_user_data',
    'ad_personalization',
    'analytics_storage',
    'functionality_storage',
    'personalization_storage',
    'security_storage'
  ];

  if (allTypesChosen) return allConsentTypes;
  else {
    return data.consentTypeTable.map((consent) => consent.consentType);
  }
}

function consentUpdateDispatcher(consentType, consentStatus) {
  dataLayerDispatcher({
    event: eventName,
    consent_type: consentType,
    consent_status: consentStatus ? 'granted' : 'denied'
  });
}

function addConsentStatusListener(typesToListen) {
  typesToListen.forEach((consentType) => {
    addConsentListener(consentType, consentUpdateDispatcher);
  });
}


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "dataLayer"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_consent",
        "versionId": "1"
      },
      "param": [
        {
          "key": "consentTypes",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "ad_storage"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "ad_user_data"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "ad_personalization"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "analytics_storage"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "functionality_storage"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "personalization_storage"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "security_storage"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "get_url",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urlParts",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "queriesAllowed",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 06/07/2026, 06:29:16


