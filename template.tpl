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
  "displayName": "Google Consent Mode Listener Tag by Stape",
  "categories": [
    "UTILITY"
  ],
  "brand": {
    "id": "brand_dummy",
    "displayName": "stape.io",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAYAAABWzo5XAAABYElEQVR4AZ1TAUQFQRBdhBBCCCGEECCE8IEAkCT1b8ftdrt7oYAQ+gQIAUIA+AgQAoQQAgSAACGEcDjUPHag27vu32McNzNv386bVf9hrywXiGheDcWhtSvahGtt3Jc2/iPL/SVRudybYJy7TW6cctQxpjr3D/z94ag47sbGb7QTHPsdVvCMBqiAGqiSPBXFurbhNpJxTXgk60cNIk4+cXxmxp1iLqoFB0WxpK2/wGHoaSFCohtEZ4tSP5iIZ7ULJZjjQCIh8TXmiKv3IsLedJHE+jf+f98gggucfI+yeW+K7TYSAMbAxQSRu4KtWLq4Bt9YwhTJkSnXUKtzZ5pu2LCFpNgvOyUkiUNr2bPUnF5xLcwIzdq6m78kUAznGvNJqULRaDKZSzxgUVoR+VXVhcyEcyET90SJXDezbl/1AZ4AGuAiO3MSZ1JhLnyQVrMA9nPjCwjlkcqrHwRYLe504RfU6/XwKT3D8gAAAABJRU5ErkJggg\u003d\u003d"
  },
  "description": "This tag listens to updates in Google Consent Mode types and pushes a single event containing the state of all monitored consent types to the dataLayer or a custom named dataLayer.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "GROUP",
    "name": "configGroup",
    "subParams": [
      {
        "type": "SELECT",
        "name": "monitoredConsentScope",
        "displayName": "Consent Types to Monitor",
        "selectItems": [
          {
            "value": "allTypes",
            "displayValue": "All Consent Types"
          },
          {
            "value": "specificTypes",
            "displayValue": "Specific Consent Types (choose below)"
          }
        ],
        "simpleValueType": true,
        "defaultValue": "allTypes",
        "help": "Choose whether to listen to all consent types or only specific ones.\n\u003cbr/\u003e\u003cbr/\u003e\n\u003cb\u003eAll Consent Types\u003c/b\u003e monitors: \u003cb\u003ead_storage\u003c/b\u003e, \u003cb\u003ead_user_data\u003c/b\u003e, \u003cb\u003ead_personalization\u003c/b\u003e, \u003cb\u003eanalytics_storage\u003c/b\u003e, \u003cb\u003efunctionality_storage\u003c/b\u003e, \u003cb\u003epersonalization_storage\u003c/b\u003e and \u003cb\u003esecurity_storage\u003c/b\u003e.\n\u003cbr/\u003e\u003cbr/\u003e\nCheck \u003ca href\u003d\u0027https://developers.google.com/tag-platform/security/concepts/consent-mode#consent-types\u0027 target\u003d\"_blank\"\u003e documentation \u003c/a\u003e for more details on each type of consent.",
        "alwaysInSummary": true
      },
      {
        "type": "SIMPLE_TABLE",
        "name": "specificConsentTypes",
        "displayName": "Consent Types",
        "simpleTableColumns": [
          {
            "defaultValue": "ad_storage",
            "displayName": "",
            "name": "consentType",
            "type": "SELECT",
            "selectItems": [
              {
                "value": "ad_storage",
                "displayValue": "ad_storage"
              },
              {
                "value": "ad_user_data",
                "displayValue": "ad_user_data"
              },
              {
                "value": "ad_personalization",
                "displayValue": "ad_personalization"
              },
              {
                "value": "analytics_storage",
                "displayValue": "analytics_storage"
              },
              {
                "value": "functionality_storage",
                "displayValue": "functionality_storage"
              },
              {
                "value": "personalization_storage",
                "displayValue": "personalization_storage"
              },
              {
                "value": "security_storage",
                "displayValue": "security_storage"
              }
            ],
            "isUnique": true,
            "valueValidators": []
          }
        ],
        "help": "Choose the consent types to listen to.\n\u003cbr/\u003e\nCheck the \u003ca href\u003d\u0027https://developers.google.com/tag-platform/security/concepts/consent-mode#consent-types\u0027 target\u003d\"_blank\"\u003edocumentation\u003c/a\u003e for more details on each consent type.",
        "newRowButtonText": "Add consent type",
        "enablingConditions": [
          {
            "paramName": "monitoredConsentScope",
            "paramValue": "specificTypes",
            "type": "EQUALS"
          }
        ],
        "alwaysInSummary": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      },
      {
        "type": "CHECKBOX",
        "name": "useCustomEventName",
        "checkboxText": "Use custom event name",
        "simpleValueType": true,
        "help": "Allows you to use a custom event name. Defaults to \u003cb\u003estape_consent_update\u003c/b\u003e.",
        "subParams": [
          {
            "type": "TEXT",
            "name": "customEventName",
            "displayName": "Custom Event Name",
            "simpleValueType": true,
            "enablingConditions": [
              {
                "paramName": "useCustomEventName",
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
        "help": "Allows you to use a custom dataLayer name. Defaults to \u003cb\u003edataLayer\u003c/b\u003e. If you need a custom name, check the warning below."
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const addConsentListener = require('addConsentListener');
const callLater = require('callLater');
const createQueue = require('createQueue');
const getType = require('getType');
const getUrl = require('getUrl');
const isConsentGranted = require('isConsentGranted');

/*==============================================================================
==============================================================================*/

if (shouldExitEarly(data)) return data.gtmOnSuccess();

const typesToListen = getUserConsentTypesSelection(data);

addConsentStatusListener(data, typesToListen);

return data.gtmOnSuccess();

/*==============================================================================
==============================================================================*/

function getUserConsentTypesSelection(data) {
  const allConsentTypes = [
    'ad_storage',
    'ad_user_data',
    'ad_personalization',
    'analytics_storage',
    'functionality_storage',
    'personalization_storage',
    'security_storage'
  ];

  if (data.monitoredConsentScope === 'allTypes') return allConsentTypes;
  else {
    return data.specificConsentTypes.map((d) => d.consentType);
  }
}

function addConsentStatusListener(data, typesToListen) {
  const dataLayerName =
    data.useCustomDataLayer && data.customDataLayerName ? data.customDataLayerName : 'dataLayer';
  const dataLayerDispatcher = createQueue(dataLayerName);

  let flushScheduled = false;
  function flushConsentState() {
    flushScheduled = false;

    const consentState = {};
    typesToListen.forEach((consentType) => {
      consentState[consentType] = isConsentGranted(consentType) ? 'granted' : 'denied';
    });

    const eventName =
      data.useCustomEventName && data.customEventName
        ? data.customEventName
        : 'stape_consent_update';

    dataLayerDispatcher({
      event: eventName,
      consent: consentState
    });
  }

  typesToListen.forEach((consentType) => {
    addConsentListener(consentType, () => {
      if (flushScheduled) return;
      flushScheduled = true;
      callLater(flushConsentState);
    });
  });
}

/*==============================================================================
Helpers
==============================================================================*/

function shouldExitEarly(data) {
  const url = getUrl();

  if (url && url.lastIndexOf('https://gtm-msr.appspot.com/', 0) === 0) {
    return true;
  }

  const isConsentTableValidArray =
    getType(data.specificConsentTypes) === 'array' && data.specificConsentTypes.length > 0;
  if (data.monitoredConsentScope === 'specificTypes' && !isConsentTableValidArray) {
    return true;
  }

  return false;
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

scenarios:
- name: '[Early Exit] Preview server URL does not register any consent listener'
  code: |-
    mock('getUrl', () => 'https://gtm-msr.appspot.com/preview');

    runCode(createMockData());

    assertApi('addConsentListener').wasNotCalled();
    assertApi('gtmOnSuccess').wasCalled();
    assertApi('gtmOnFailure').wasNotCalled();
- name: '[Early Exit] Specific types selected with an empty table exits early'
  code: |-
    const mockData = createMockData({
      monitoredConsentScope: 'specificTypes',
      specificConsentTypes: []
    });

    runCode(mockData);

    assertApi('addConsentListener').wasNotCalled();
    assertApi('gtmOnSuccess').wasCalled();
    assertApi('gtmOnFailure').wasNotCalled();
- name: '[Early Exit] Specific types selected without a table exits early'
  code: |-
    const mockData = createMockData({
      monitoredConsentScope: 'specificTypes',
      specificConsentTypes: undefined
    });

    runCode(mockData);

    assertApi('addConsentListener').wasNotCalled();
    assertApi('gtmOnSuccess').wasCalled();
    assertApi('gtmOnFailure').wasNotCalled();
- name: '[Consent Types] Listens to all 7 consent types when All Types is selected'
  code: |-
    const registeredTypes = [];
    mock('addConsentListener', (consentType) => {
      registeredTypes.push(consentType);
    });

    runCode(createMockData({ monitoredConsentScope: 'allTypes' }));

    assertThat(registeredTypes).containsExactly(
      'ad_storage',
      'ad_user_data',
      'ad_personalization',
      'analytics_storage',
      'functionality_storage',
      'personalization_storage',
      'security_storage'
    );
    assertApi('gtmOnSuccess').wasCalled();
    assertApi('gtmOnFailure').wasNotCalled();
- name: '[Consent Types] Only listens to the selected types when Specific Types is
    chosen'
  code: |-
    const registeredTypes = [];
    mock('addConsentListener', (consentType) => {
      registeredTypes.push(consentType);
    });

    const mockData = createMockData({
      monitoredConsentScope: 'specificTypes',
      specificConsentTypes: [
        { consentType: 'ad_storage' },
        { consentType: 'analytics_storage' }
      ]
    });

    runCode(mockData);

    assertThat(registeredTypes).containsExactly('ad_storage', 'analytics_storage');
    assertApi('gtmOnSuccess').wasCalled();
    assertApi('gtmOnFailure').wasNotCalled();
- name: '[Data Layer] Pushes to the default dataLayer with the default event name'
  code: |-
    const consentListeners = {};
    const pushedEvents = [];
    let scheduledFlush;

    mock('addConsentListener', (consentType, listener) => {
      consentListeners[consentType] = listener;
    });
    mock('isConsentGranted', () => false);
    mock('callLater', (fn) => {
      scheduledFlush = fn;
    });
    mock('createQueue', () => (obj) => {
      pushedEvents.push(obj);
    });

    runCode(createMockData());

    consentListeners.ad_storage('ad_storage', true);
    scheduledFlush();

    assertApi('createQueue').wasCalledWith('dataLayer');
    assertThat(pushedEvents).hasLength(1);
    assertThat(pushedEvents[0].event).isEqualTo('stape_consent_update');
    assertApi('gtmOnSuccess').wasCalled();
    assertApi('gtmOnFailure').wasNotCalled();
- name: '[Data Layer] Uses the custom event name when configured'
  code: |-
    const consentListeners = {};
    const pushedEvents = [];
    let scheduledFlush;

    mock('addConsentListener', (consentType, listener) => {
      consentListeners[consentType] = listener;
    });
    mock('isConsentGranted', () => false);
    mock('callLater', (fn) => {
      scheduledFlush = fn;
    });
    mock('createQueue', () => (obj) => {
      pushedEvents.push(obj);
    });

    const mockData = createMockData({
      useCustomEventName: true,
      customEventName: 'my_custom_consent_event'
    });

    runCode(mockData);

    consentListeners.ad_storage('ad_storage', true);
    scheduledFlush();

    assertThat(pushedEvents[0].event).isEqualTo('my_custom_consent_event');
    assertApi('gtmOnSuccess').wasCalled();
    assertApi('gtmOnFailure').wasNotCalled();
- name: '[Data Layer] Uses the custom dataLayer name when configured'
  code: |-
    const mockData = createMockData({
      useCustomDataLayer: true,
      customDataLayerName: 'myCustomDataLayer'
    });

    runCode(mockData);

    assertApi('createQueue').wasCalledWith('myCustomDataLayer');
    assertApi('gtmOnSuccess').wasCalled();
    assertApi('gtmOnFailure').wasNotCalled();
- name: '[Debounce] Multiple consent type changes in the same tick produce a single
    push'
  code: |-
    const consentListeners = {};
    const consentState = {
      ad_storage: false,
      ad_user_data: false,
      ad_personalization: false,
      analytics_storage: false,
      functionality_storage: false,
      personalization_storage: false,
      security_storage: false
    };
    const pushedEvents = [];
    let scheduledFlush;
    let callLaterCallCount = 0;

    mock('addConsentListener', (consentType, listener) => {
      consentListeners[consentType] = listener;
    });
    mock('isConsentGranted', (consentType) => consentState[consentType]);
    mock('callLater', (fn) => {
      callLaterCallCount++;
      scheduledFlush = fn;
    });
    mock('createQueue', () => (obj) => {
      pushedEvents.push(obj);
    });

    runCode(createMockData({ monitoredConsentScope: 'allTypes' }));

    // Simulate a banner "accept all" click updating several consent types
    // within the same tick.
    consentState.ad_storage = true;
    consentListeners.ad_storage('ad_storage', true);
    consentState.analytics_storage = true;
    consentListeners.analytics_storage('analytics_storage', true);
    consentState.functionality_storage = true;
    consentListeners.functionality_storage('functionality_storage', true);

    assertThat(callLaterCallCount).isEqualTo(1);
    assertThat(pushedEvents).isEmpty();

    scheduledFlush();

    assertThat(pushedEvents).hasLength(1);
    assertThat(pushedEvents[0].consent).isEqualTo({
      ad_storage: 'granted',
      ad_user_data: 'denied',
      ad_personalization: 'denied',
      analytics_storage: 'granted',
      functionality_storage: 'granted',
      personalization_storage: 'denied',
      security_storage: 'denied'
    });
    assertApi('gtmOnSuccess').wasCalled();
    assertApi('gtmOnFailure').wasNotCalled();
- name: '[Debounce] A new update after a flush schedules a new push'
  code: |-
    const consentListeners = {};
    const consentState = {
      ad_storage: false,
      ad_user_data: false,
      ad_personalization: false,
      analytics_storage: false,
      functionality_storage: false,
      personalization_storage: false,
      security_storage: false
    };
    const pushedEvents = [];
    const scheduledFlushes = [];

    mock('addConsentListener', (consentType, listener) => {
      consentListeners[consentType] = listener;
    });
    mock('isConsentGranted', (consentType) => consentState[consentType]);
    mock('callLater', (fn) => {
      scheduledFlushes.push(fn);
    });
    mock('createQueue', () => (obj) => {
      pushedEvents.push(obj);
    });

    runCode(createMockData({ monitoredConsentScope: 'allTypes' }));

    consentState.ad_storage = true;
    consentListeners.ad_storage('ad_storage', true);
    scheduledFlushes[0]();

    consentState.analytics_storage = true;
    consentListeners.analytics_storage('analytics_storage', true);
    scheduledFlushes[1]();

    assertThat(scheduledFlushes).hasLength(2);
    assertThat(pushedEvents).hasLength(2);
    assertThat(pushedEvents[0].consent.ad_storage).isEqualTo('granted');
    assertThat(pushedEvents[1].consent.analytics_storage).isEqualTo('granted');
    assertApi('gtmOnSuccess').wasCalled();
    assertApi('gtmOnFailure').wasNotCalled();
setup: |-
  const assign = (target, source) => {
    for (const key in source) {
      if (source.hasOwnProperty(key)) target[key] = source[key];
    }
    return target;
  };

  const baseMockData = {
    monitoredConsentScope: 'allTypes',
    specificConsentTypes: [],
    useCustomEventName: false,
    customEventName: undefined,
    useCustomDataLayer: false,
    customDataLayerName: undefined
  };

  const createMockData = (overrides) => {
    return assign(assign({}, baseMockData), overrides || {});
  };

  // Sensible defaults so tests that don't care about a given API still run
  // without hitting the early-exit path or touching the real window/globals.
  mock('getUrl', () => 'https://example.com/');
  mock('isConsentGranted', () => false);
  mock('addConsentListener', () => {});
  mock('callLater', () => {});
  mock('createQueue', () => () => {});


___NOTES___

2026-08-07 - Change Notes:
  - Push a single aggregated event containing the state of every monitored consent type (e.g. {ad_storage: 'granted', analytics_storage: 'denied'}) instead of one event per type, so consumers get a complete consent snapshot in one dataLayer push; consent updates arriving in the same tick are coalesced via callLater and the payload is rebuilt from isConsentGranted so it is always current
  - Remove the debug logToConsole call and its now-unused logging permission, so the tag no longer writes the tag configuration to the browser console
  - Add a unit test suite covering early exits, consent type selection, custom event/dataLayer names, and the single-push debounce behaviour, replacing the empty placeholder test
  - Update the gallery description to reflect the single aggregated event and correct the transposed "Google Mode Consent" wording

Created on 06/07/2026, 06:29:16

