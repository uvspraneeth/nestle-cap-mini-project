namespace com.nestle.manufacturing.pm.notificationitems;


using {} from '../../common/types';
using {
    com.nestle.manufacturing.pm.maintnotifications.MaintNotification as MaintNotifications
    } from './MaintNotification';


/*
Represents individual defects or issues identified under a notification.

Attributes
Field	Description
ItemID (PK)	Unique item ID
Notification → MaintNotifications	Parent notification
DamageCode	Standardized damage classification (e.g., bearing failure)
CauseCode	Root cause classification (e.g., lubrication issue)
Description	Detailed explanation of issue
Severity	Minor / Moderate / Severe
IsSafetyRelated	Boolean (Yes/No)
Status	Pending / Analyzed / Closed

Purpose
Allows structured diagnosis under a single maintenance report — multiple defects can be logged per notification.
*/

type NotfiStatus : String enum {
    Pending;
    Analyzed;
    Closed;
}

type NotifSeverity : String enum {
    Minor;
    Moderate;
    Severe
};

entity NotificationItem {
    key ID : String(7);
    notification : Association to MaintNotifications;
    damageCode : String;
    causeCode : String;
    description :String;
    severity : NotifSeverity;
    isSafetyRelated : Boolean;
    status : NotfiStatus
}