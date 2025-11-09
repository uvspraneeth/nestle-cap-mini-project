using NestlePPPMPublicService as service from '../../srv/nestle-pppm-service';

//===================================================================
//  Production Orders (Main Object Page)
//===================================================================
annotate service.ProductionOrders with @(
    UI.HeaderInfo : {
        TypeName       : 'Production Order',
        TypeNamePlural : 'Production Orders',
        Title          : { Value : ID },
        Description    : { Value : status }
    },

    //=============================================================
    // Order Summary
    //=============================================================
    UI.FieldGroup #OrderSummary : {
        $Type : 'UI.FieldGroupType',
        Data : [
            { $Type : 'UI.DataField', Label : 'Order ID', Value : ID },
            { $Type : 'UI.DataField', Label : 'Order Type', Value : orderTypeCode },
            { $Type : 'UI.DataField', Label : 'Status', Value : status },
            { $Type : 'UI.DataField', Label : 'Priority', Value : priority },
            { $Type : 'UI.DataField', Label : 'Order Quantity', Value : orderQty },
            { $Type : 'UI.DataField', Label : 'UoM', Value : unitOfMeasure }
        ]
    },

    //=============================================================
    //  Schedule Information
    //=============================================================
    UI.FieldGroup #ScheduleInfo : {
        $Type : 'UI.FieldGroupType',
        Data : [
            { $Type : 'UI.DataField', Label : 'Start Date', Value : startDate },
            { $Type : 'UI.DataField', Label : 'Due Date', Value : dueDate },
            { $Type : 'UI.DataField', Label : 'Created On', Value : createdOn },
            { $Type : 'UI.DataField', Label : 'Created By', Value : createdBy }
        ]
    },

    //=============================================================
    // Material Master (Navigation via Association)
    //=============================================================
    UI.FieldGroup #MaterialRef : {
        $Type : 'UI.FieldGroupType',
        Data : [
            { $Type : 'UI.DataField', Label : 'Material ID', Value : material_ID },
            { $Type : 'UI.DataField', Label : 'Material Name', Value : material.materialDescription },
            { $Type : 'UI.DataField', Label : 'Material Type', Value : material.materialType },
            { $Type : 'UI.DataField', Label : 'Base Unit', Value : material.UoM },
            { $Type : 'UI.DataField', Label : 'Material Group', Value : material.materialGroup }
        ]
    },

    //=============================================================
    // Work Center (Navigation via Association)
    //=============================================================
    UI.FieldGroup #WorkCenterRef : {
        $Type : 'UI.FieldGroupType',
        Data : [
            { $Type : 'UI.DataField', Label : 'Work Center ID', Value : workCenter_ID },
            { $Type : 'UI.DataField', Label : 'Work Center Name', Value : workCenter.description },
            { $Type : 'UI.DataField', Label : 'Plant', Value : workCenter.plant },
            { $Type : 'UI.DataField', Label : 'Capacity Category', Value : workCenter.category }
        ]
    },

    //=============================================================
    // Facets: Grouped into clean layout
    //=============================================================
    UI.Facets : [
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'OrderHeaderGroup',
            Label  : 'Order Overview',
            Facets : [
                { $Type : 'UI.ReferenceFacet', Label : 'Summary', Target : '@UI.FieldGroup#OrderSummary' },
                { $Type : 'UI.ReferenceFacet', Label : 'Schedule', Target : '@UI.FieldGroup#ScheduleInfo' }
            ]
        },
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'MasterDataGroup',
            Label  : 'Master Data',
            Facets : [
                { $Type : 'UI.ReferenceFacet', Label : 'Material', Target : '@UI.FieldGroup#MaterialRef' },
                { $Type : 'UI.ReferenceFacet', Label : 'Work Center', Target : '@UI.FieldGroup#WorkCenterRef' }
            ]
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'OperationsFacet',
            Label : 'Order Operations',
            Target: 'orderOperations/@UI.LineItem'
        }
    ],

    //=============================================================
    //  List Report View
    //=============================================================
    UI.LineItem : [
        { $Type : 'UI.DataField', Label : 'Order ID', Value : ID },
        { $Type : 'UI.DataField', Label : 'Material', Value : material.materialDescription },
        { $Type : 'UI.DataField', Label : 'Work Center', Value : workCenter.description },
        { $Type : 'UI.DataField', Label : 'Planned Qty', Value : orderQty },
        { $Type : 'UI.DataField', Label : 'UoM', Value : unitOfMeasure },
        { $Type : 'UI.DataField', Label : 'Priority', Value : priority },
        { $Type : 'UI.DataField', Label : 'Status', Value : status }
    ]
);

//===================================================================
//  Order Operations – 2nd Level
//===================================================================
annotate service.OrderOperations with @(
    UI.HeaderInfo : {
        TypeName       : 'Operation',
        TypeNamePlural : 'Operations',
        Title          : { Value : operationText },
        Description    : { Value : status }
    },

    UI.LineItem : [
        { $Type : 'UI.DataField', Label : 'Seq. No', Value : seqNo },
        { $Type : 'UI.DataField', Label : 'Operation Text', Value : operationText },
        { $Type : 'UI.DataField', Label : 'Work Center', Value : workcenter.description },
        { $Type : 'UI.DataField', Label : 'Start', Value : startDate },
        { $Type : 'UI.DataField', Label : 'End', Value : endDate },
        { $Type : 'UI.DataField', Label : 'Status', Value : status },
        { $Type : 'UI.DataField', Label : 'Supervisor', Value : supervisor }
    ],

    UI.Facets : [
        { $Type : 'UI.ReferenceFacet', Label : 'Components', Target : 'operationComponents/@UI.LineItem' }
    ]
);

//===================================================================
// Operation Components – 3rd Level
//===================================================================
annotate service.OperationComponents with @(
    UI.HeaderInfo : {
        TypeName       : 'Operation Component',
        TypeNamePlural : 'Operation Components',
        Title          : { Value : ID },
        Description    : { Value : status }
    },
    UI.LineItem : [
        { $Type : 'UI.DataField', Label : 'Material', Value : material.materialDescription },
        { $Type : 'UI.DataField', Label : 'Required Qty', Value : requiredQty },
        { $Type : 'UI.DataField', Label : 'Issued Qty', Value : issuedQty },
        { $Type : 'UI.DataField', Label : 'UoM', Value : unitofMeasure },
        { $Type : 'UI.DataField', Label : 'Storage Location', Value : storageLocation },
        { $Type : 'UI.DataField', Label : 'Batch', Value : batch },
        { $Type : 'UI.DataField', Label : 'Status', Value : Status }
    ]
);
