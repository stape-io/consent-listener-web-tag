# Google Consent Mode Listener Tag for Google Tag Manager Web

This utility template for Google Tag Manager (Web) listens for Google Consent Mode state transitions and pushes a single, standardized event to your dataLayer containing the state of every monitored consent type.

## Setup Instructions

1. **Import** the template from the Community Template Gallery into your GTM Web workspace.
2. **Create** a new tag using the _Google Consent Mode Listener Tag by Stape_ template.
3. **Configure** the specific Consent Types you want to monitor (defaults to _All Consent Types_).
4. **Set** your custom event name and dataLayer array name, if necessary.
5. **Assign** a trigger that strictly follows your CMP execution (see the *⚠️ Critical: Execution Order* section below).

## What Gets Pushed to the dataLayer

Whenever one or more monitored consent types change, the tag pushes **one** event containing a `consent` object with the current state of **all** monitored types:

```js
{
  event: 'stape_consent_update',
  consent: {
    ad_storage: 'granted',
    ad_user_data: 'granted',
    ad_personalization: 'denied',
    analytics_storage: 'granted',
    functionality_storage: 'denied',
    personalization_storage: 'denied',
    security_storage: 'granted'
  }
}
```

- Every value is either `'granted'` or `'denied'`.
- The `consent` object only contains the types you chose to monitor. If you select _Specific Consent Types_, only those keys are present.
- `event` defaults to `stape_consent_update` and can be overridden with the **Use custom event name** option.

**Consent updates are batched.** When a user clicks something like "Accept All", a CMP typically updates several consent types at once. Rather than emitting one event per type, the tag waits for the current batch of updates to settle and then emits a **single** event reflecting the final state. This keeps your triggers and tags from firing repeatedly for what is really one user action.

Consent changes that happen in genuinely separate interactions (for example, the user reopens the banner later and changes a setting) produce their own separate event, as expected.

### Using it in GTM

Create a **Custom Event** trigger matching your event name (`stape_consent_update` by default), and read individual values with **Data Layer Variable**s using dot notation:

- `consent.ad_storage`
- `consent.analytics_storage`

## ⚠️ Critical: Execution Order

**This listener tag must execute AFTER your CMP has established the `default` consent baseline.** If this tag fires before a `default` consent state exists, GTM's native listener API will consider that consent state as `granted`, which can lead to inaccurate consent state reporting later when the user actually makes a choice and the `update` command is triggered.

**Recommended Triggering Strategy:**

- **Standard Implementation:** If your CMP tag sets the `default` state using the **Consent Initialization - All Pages** trigger, you should fire this Consent Listener tag on the **Initialization - All Pages** trigger.
- **Tag Sequencing:** Alternatively, use GTM's Tag Sequencing feature to guarantee this listener tag fires immediately after your CMP tag completes its execution.

## 🛑 Warning: Custom dataLayer Names & Gallery Unlinking

If your website uses a non-standard dataLayer namespace (e.g., `myCustomLayer`), you can configure this tag to use it, but it requires manual permission overrides (see below).

**The Trade-off:**

- You must manually edit the template's **Accesses Global Variables** permissions to explicitly allow read/write/execute access to your custom array name.
- Modifying template permissions will **permanently unlink** this template from the GTM Community Gallery.
- Once unlinked, you will no longer receive automated **bug fixes, new features, or structural updates** published by the repository maintainers.

## Open Source

The **Google Consent Mode Listener Tag for GTM** is developed and maintained by the [Stape Team](https://stape.io/) under the Apache 2.0 license.

### GTM Gallery Status
🔴 Not listed
