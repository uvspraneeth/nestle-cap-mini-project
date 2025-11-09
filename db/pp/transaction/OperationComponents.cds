namespace com.nestle.manufacturing.pp.operationcomponents;
using { com.nestle.manufacturing.pp.materials.MaterialMaster as MaterialMaster } from '../master/Materials';
using { com.nestle.manufacturing.pp.orderoperations.OrderOperation as OrderOperation} from './OrderOperations';
using { nestle.manufacturing.common.UoM } from '../../common/types';

/*
ComponentID (PK)	Unique component record ID
Operation → OrderOperations	Parent operation
Material → Materials	Material to be consumed
RequiredQty	Required quantity for operation
IssuedQty	Actual issued quantity
UoM	Unit of measure
StorageLocation	Location from where material is issued
Batch	Batch number if batch-managed
Status	Planned / Issued / Consumed
*/

type ComponentStatus : String enum {
    Planned;
    Issued;
    Consumed;
}

entity OperationComponent {
    key ID : String(7);
    operation : Association to OrderOperation;
    material : Association to MaterialMaster;
    requiredQty : Integer;
    issuedQty : Integer;
    unitofMeasure : UoM;
    storageLocation : String;
    batch  : Integer;
    Status : ComponentStatus
}
