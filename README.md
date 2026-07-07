# Google Consent Mode Listener Tag

This utility template for Google Tag Manager (Web) listens for Google Consent Mode state transitions and pushes a standardized event to your dataLayer.

## Setup Instructions

1. **Import** the template from the Community Template Gallery into your GTM Web workspace.
2. **Create** a new tag using the _Google Consent Mode Listener Tag by Stape_ template.
3. **Configure** the specific Consent Types you want to monitor (defaults to _All Consent Types_).
4. **Set** your custom event name and dataLayer array name, if necessary.
5. **Assign** a trigger that strictly follows your CMP execution (see the *⚠️ Critical: Execution Order* section below).

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
