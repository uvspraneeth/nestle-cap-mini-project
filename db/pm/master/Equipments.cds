namespace com.nestle.manufacturing.pm.equipements;

using {nestle.manufacturing.common.Plant as Plant} from '../../common/types';

/*
Represents individual assets (e.g., filling machines, pumps).
Required Attributes:

EquipmentID
Description
FunctionalLocation
Plant
Manufacturer
ModelNumber
CommissionDate
Status (Active / Under Maintenance / Decommissioned)

Use Case Links:
Referenced in MaintNotifications
*/

type EquipmentStatus : String enum {
    Active;
    UnderMaintenance = 'Under Maintenance';
    Decommissioned
};

entity Equipment {
    key ID : String(7);
    description : String;
    functionalLocation : String(30);
    plant  : Plant;
    manufacturer : String(30);
    modelNumber : String(10);
    commissionDate : Date;
    status : EquipmentStatus
}
