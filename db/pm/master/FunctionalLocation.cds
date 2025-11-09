namespace com.nestle.manufacturing.pm.functionalLocs;

using {
    nestle.manufacturing.common.Plant as Plant,
    nestle.manufacturing.common.IsActive as IsActive
} from '../../common/types';

/*
4. Functional Locations

Represents logical or physical plant areas.

Required Attributes:

FuncLocID
Description
Plant
ParentFuncLocID (for hierarchy)
LocationType (Area / Section / Building)
IsActive

*/

type LocationTypes : String enum {
    Area;
    Section;
    Building
}

entity FunctionalLocation {
    key ID : String(5);
    description : String;
    plant : Plant;
    locationType : LocationTypes;
    IsActive : IsActive
}