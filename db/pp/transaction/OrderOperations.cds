namespace com.nestle.manufacturing.pp.orderoperations;
using { com.nestle.manufacturing.pp.workcenters.WorkCenterMaster as WorkCenterMaster } from '../master/WorkCenters';
using { com.nestle.manufacturing.pp.productorders.ProductOrder as ProductOrder } from './ProdOrders';
using { com.nestle.manufacturing.pp.operationcomponents.OperationComponent } from './OperationComponents';

/*
Field	Description
OperationID (PK)	Unique operation step ID
Order → ProdOrders	Association to the parent order
SeqNo	Sequence number (e.g., 10, 20, 30)
WorkCenter → WorkCenters	Machine/line performing the operation
OperationText	Description of operation
StdTimeMin	Standard time for completion (minutes)
StartDate	Scheduled start
EndDate	Scheduled end
Status	Pending / In Process / Completed
Supervisor	Responsible operator or team lead
*/

type OperationStatus : String enum {
    Pending;
    InProcess = 'In Process';
    Completed
}

entity OrderOperation {
    key ID : String(7);
    order : Association to ProductOrder;
    seqNo : Integer;
    workcenter : Association to WorkCenterMaster;
    operationText : String;
    stdTimeMin : Integer;
    startDate : Date;
    endDate : Date;
    status : OperationStatus;
    supervisor : String(30);
    components : Composition of many OperationComponent on components.operation = $self
}