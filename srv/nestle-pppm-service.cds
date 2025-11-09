using { com.nestle.manufacturing.pp.productionorders as po } from '../db/pp/transaction/ProdOrders';
using { com.nestle.manufacturing.pp.orderoperations as oo } from '../db/pp/transaction/OrderOperations';
using { com.nestle.manufacturing.pp.operationcomponents as oc } from '../db/pp/transaction/OperationComponents';
using { com.nestle.manufacturing.pm.maintenancetasks as mt} from '../db/pm/transaction/MaintanenceTasks';
using { com.nestle.manufacturing.pm.maintnotifications as mn} from '../db/pm/transaction/MaintNotification';
using { com.nestle.manufacturing.pm.notificationitems as ni} from '../db/pm/transaction/NotificationItems';




service NestlePPPMPublicService {

    entity ProductOrders as projection on po.ProductionOrder;
    entity OrderOperations as projection on oo.OrderOperation;
    entity OperationComponents as projection on oc.OperationComponent;
    entity MaintanenceTasks as projection on mt.MaintenanceTask;
    entity MaintNotifications as projection on mn.MaintNotification;
    entity NotificationItems as projection on ni.NotificationItem;
    
}

