namespace com.nestle.manufacturing.pm.maintnotifications;

using {com.nestle.manufacturing.pm.equipements.Equipment} from '../master/Equipments';
using {com.nestle.manufacturing.pm.functionalLocs.FunctionalLocation} from '../master/FunctionalLocation';
using {com.nestle.manufacturing.pm.notificationitems.NotificationItem} from './NotificationItems';

using {
    nestle.manufacturing.common.PriorityLevels,
    nestle.manufacturing.common.Plant
} from '../../common/types';

/*
Field	Description
NotifID (PK)	Unique maintenance notification ID
NotifType	Breakdown / Preventive / Inspection
NotifDate	Date/time of report
Equip → Equipments	Equipment that has the issue
FuncLoc → FunctionalLocations	Where the fault occurred
Priority	Low / Medium / High / Critical
ShortText	Brief problem description
LongText	Detailed notes
Status	New / In Process / Completed / Closed
ReportedBy	Employee or operator
ReportedOn	Timestamp
Plant	Plant code (e.g., “IN02”)
Purpose

Captures all incoming fault reports and maintenance requests — serves as the header document for downstream repair work.
*/
type NotificationTypes : String enum {
    Breakdown;
    Preventive;
    Inspection
}

type MaintenanceStatus : String enum {
    New;
    InProcess = 'In Process';
    Completed;
    Closed;
};


entity MaintNotification {
    key ID         : String(7);
        notifType  : NotificationTypes;
        notifDate  : Date;
        equipment  : Association to Equipment;
        funcLoc    : Association to FunctionalLocation;
        priority   : PriorityLevels;
        shortText  : String(111);
        LongText   : String;
        status     : MaintenanceStatus;
        plant      : Plant;
        reportedBy : String;
        reportedOn : Date;
        items      : Composition of many NotificationItem
                         on items.notification = $self
}
