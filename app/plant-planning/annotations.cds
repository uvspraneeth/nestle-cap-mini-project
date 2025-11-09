using NestlePPPMPublicService as service from '../../srv/nestle-pppm-service';

//===================================================================
// PRODUCT ORDERS (Level 1)
//===================================================================
annotate service.ProductionOrders with @(
    UI.HeaderInfo: {
        TypeName: 'Production Order',
        TypeNamePlural: 'Production Orders',
        Title: { Value: ID },
        Description: { Value: orderTypeCode }
    },

    UI.Facets: [
        { $Type: 'UI.ReferenceFacet', Label: 'General Information', Target: '@UI.FieldGroup#GeneralInfo' },
        { $Type: 'UI.ReferenceFacet', Label: 'Scheduling', Target: '@UI.FieldGroup#Schedule' },
        { $Type: 'UI.ReferenceFacet', Label: 'Operations', Target: 'operations/@UI.LineItem' }
    ],

    UI.FieldGroup #GeneralInfo: {
        Data: [
            { $Type: 'UI.DataField', Label: 'Order ID', Value: ID },
            { $Type: 'UI.DataField', Label: 'Plant', Value: plant },
            { $Type: 'UI.DataField', Label: 'Order Type', Value: orderTypeCode },
            { $Type: 'UI.DataField', Label: 'Status', Value: status },
            { $Type: 'UI.DataField', Label: 'Priority', Value: priority },
            { $Type: 'UI.DataField', Label: 'Created By', Value: createdBy },
            { $Type: 'UI.DataField', Label: 'Created On', Value: createdOn }
        ]
    },

    UI.FieldGroup #Schedule: {
        Data: [
            { $Type: 'UI.DataField', Label: 'Order Quantity', Value: orderQty },
            { $Type: 'UI.DataField', Label: 'UoM', Value: unitOfMeasure },
            { $Type: 'UI.DataField', Label: 'Start Date', Value: startDate },
            { $Type: 'UI.DataField', Label: 'Due Date', Value: dueDate }
        ]
    },

    UI.LineItem: [
        { $Type: 'UI.DataField', Label: 'Order ID', Value: ID },
        { $Type: 'UI.DataField', Label: 'Plant', Value: plant },
        { $Type: 'UI.DataField', Label: 'Order Type', Value: orderTypeCode },
        { $Type: 'UI.DataField', Label: 'Qty', Value: orderQty },
        { $Type: 'UI.DataField', Label: 'UoM', Value: unitOfMeasure },
        { $Type: 'UI.DataField', Label: 'Status', Value: status },
        { $Type: 'UI.DataField', Label: 'Priority', Value: priority }
    ]
);

//===================================================================
// ORDER OPERATIONS (Level 2)
//===================================================================
annotate service.OrderOperations with @(
    UI.HeaderInfo: {
        TypeName: 'Operation',
        TypeNamePlural: 'Operations',
        Title: { Value: operationText },
        Description: { Value: status }
    },

    UI.Facets: [
        { $Type: 'UI.ReferenceFacet', Label: 'Operation Details', Target: '@UI.FieldGroup#OperationDetails' },
        { $Type: 'UI.ReferenceFacet', Label: 'Operation Components', Target: 'components/@UI.LineItem' }
    ],

    UI.FieldGroup #OperationDetails: {
        Data: [
            { $Type: 'UI.DataField', Label: 'Operation ID', Value: ID },
            { $Type: 'UI.DataField', Label: 'Sequence No', Value: seqNo },
            { $Type: 'UI.DataField', Label: 'Operation Text', Value: operationText },
            { $Type: 'UI.DataField', Label: 'Standard Time (Min)', Value: stdTimeMin },
            { $Type: 'UI.DataField', Label: 'Start Date', Value: startDate },
            { $Type: 'UI.DataField', Label: 'End Date', Value: endDate },
            { $Type: 'UI.DataField', Label: 'Supervisor', Value: supervisor },
            { $Type: 'UI.DataField', Label: 'Status', Value: status }
        ]
    },

    UI.LineItem: [
        { $Type: 'UI.DataField', Label: 'Operation', Value: operationText },
        { $Type: 'UI.DataField', Label: 'Seq No', Value: seqNo },
        { $Type: 'UI.DataField', Label: 'Work Center', Value: workcenter_ID },
        { $Type: 'UI.DataField', Label: 'Status', Value: status }
    ]
);

//===================================================================
// OPERATION COMPONENTS (Level 3)
//===================================================================
annotate service.OperationComponents with @(
    UI.HeaderInfo: {
        TypeName: 'Component',
        TypeNamePlural: 'Components',
        Title: { Value: material_ID },
        Description: { Value: Status }
    },

    UI.FieldGroup #ComponentDetails: {
        Data: [
            { $Type: 'UI.DataField', Label: 'Component ID', Value: ID },
            { $Type: 'UI.DataField', Label: 'Material ID', Value: material_ID },
            { $Type: 'UI.DataField', Label: 'Required Qty', Value: requiredQty },
            { $Type: 'UI.DataField', Label: 'Issued Qty', Value: issuedQty },
            { $Type: 'UI.DataField', Label: 'UoM', Value: unitofMeasure },
            { $Type: 'UI.DataField', Label: 'Storage Location', Value: storageLocation },
            { $Type: 'UI.DataField', Label: 'Batch', Value: batch },
            { $Type: 'UI.DataField', Label: 'Status', Value: Status }
        ]
    },

    UI.LineItem: [
        { $Type: 'UI.DataField', Label: 'Material', Value: material_ID },
        { $Type: 'UI.DataField', Label: 'Required Qty', Value: requiredQty },
        { $Type: 'UI.DataField', Label: 'Issued Qty', Value: issuedQty },
        { $Type: 'UI.DataField', Label: 'UoM', Value: unitofMeasure },
        { $Type: 'UI.DataField', Label: 'Status', Value: Status }
    ]
);

