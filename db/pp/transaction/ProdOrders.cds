namespace com.nestle.manufacturing.pp.productionorders;

using {com.nestle.manufacturing.pp.materials.MaterialMaster as MaterialMaster} from '../master/Materials';
using {com.nestle.manufacturing.pp.workcenters.WorkCenterMaster as WorkCenterMaster} from '../master/WorkCenters';
using {com.nestle.manufacturing.pp.orderoperations.OrderOperation} from './OrderOperations';

using {
    nestle.manufacturing.common.Plant,
    nestle.manufacturing.common.UoM,
    nestle.manufacturing.common.PriorityLevels
} from '../../common/types';

/*
Field	Description
OrderID (PK)	Unique production order number
Material → Materials	Association to the material being produced
Plant	Plant code (e.g., “IN01”)
WorkCenter → WorkCenters	Assigned main production line
OrderType	Internal/external order type (e.g., PP01, REW1)
OrderQty	Planned quantity
UoM	Unit of measure
StartDate	Scheduled start date
DueDate	Scheduled finish date
Status	Created / Released / Completed / Closed
Priority	Low, Medium, High
CreatedBy	User or system identifier
CreatedOn	Timestamp
*/
type OrderStatus : String(15) enum {
    Created;
    Released;
    Completed;
    Closed;
};


entity ProductionOrder {
    key ID            : String(7);
        material      : Association to MaterialMaster;
        plant         : Plant;
        workCenter    : Association to WorkCenterMaster;
        orderTypeCode : String(4);
        orderQty      : Integer;
        unitOfMeasure : UoM;
        startDate     : Date;
        dueDate       : Date;
        status        : OrderStatus;
        priority      : PriorityLevels;
        createdBy     : String(30);
        createdOn     : Timestamp;
        operations    : Composition of many OrderOperation
                            on operations.order = $self
}
