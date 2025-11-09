namespace com.nestle.manufacturing.pp.workcenters;

using {
    nestle.manufacturing.common.Plant,
    nestle.manufacturing.common.IsActive
} from '../../common/types';

/*
WorkCenterID

Description

Plant

CostCenter

Category (Machine / Labor / Packaging Line)

CapacityPerShift

IsActive
*/

type WorkCenterCategory : String enum {
    Machine;
    Labor;
    PackagingLine = 'Packaging Line'
}

entity WorkCenterMaster {
    key ID     : String(7);
        description      : String;
        plant            : Plant;
        costCenter       : String(30);
        category         : WorkCenterCategory;
        capacityPerShift : Decimal(10, 2);
        isActive         : IsActive
}
