namespace com.nestle.manufacturing.pm.maintenancetasks;


using {
    nestle.manufacturing.common.UoM
} from '../../common/types';
using {
   com.nestle.manufacturing.pm.notificationitems.NotificationItem as NotificationItems
    } from './NotificationItems';
/*
Represents concrete work actions assigned to fix each notification item.

Attributes:
Field	Description
TaskID (PK)	Unique maintenance task ID
Item → NotificationItems	Parent item
TaskText	What action is to be performed (e.g., “Replace bearing”, “Clean filter”)
AssignedTo	Technician or team
StartDate	Planned start
EndDate	Planned finish
ActualStart	Actual start timestamp
ActualEnd	Actual finish timestamp
DurationHrs	Duration in hours
Material → Materials (optional)	Spare part used
Quantity	Quantity of spare
UoM	Unit of measure
WorkCenter → WorkCenters (optional)	Responsible line/area
Status	Open / In Progress / Completed / Verified
*/
type TaskStatus : String enum {
    Open;
    InProgress = 'In Progress';
    Completed;
    Verified
}

entity MaintenanceTask {
    key ID : String(7);
    items : Association to NotificationItems;
    taskText : String;
    assignedTo : String;
    startDate : Date;
    endDate : Date;
    durationHrs : Integer;
    UoM : UoM;
    status : TaskStatus 
}