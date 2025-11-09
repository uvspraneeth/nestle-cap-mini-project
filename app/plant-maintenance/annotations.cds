using NestlePPPMPublicService as service from '../../srv/nestle-pppm-service';

//===================================================================
// Maintenance Notifications (Main Object Page)
//===================================================================
annotate service.MaintNotifications with @(
    UI.HeaderInfo : {
        TypeName       : 'Maintenance Notification',
        TypeNamePlural : 'Maintenance Notifications',
        Title          : { Value : ID },
        Description    : { Value : shortText }
    },

    //=============================================================
    // Notification Summary
    //=============================================================
    UI.FieldGroup #NotifSummary : {
        $Type : 'UI.FieldGroupType',
        Data : [
            { $Type : 'UI.DataField', Label : 'Notification ID', Value : ID },
            { $Type : 'UI.DataField', Label : 'Notification Type', Value : notifType },
            { $Type : 'UI.DataField', Label : 'Priority', Value : priority },
            { $Type : 'UI.DataField', Label : 'Status', Value : status },
            { $Type : 'UI.DataField', Label : 'Reported By', Value : reportedBy },
            { $Type : 'UI.DataField', Label : 'Reported On', Value : reportedOn }
        ]
    },

    //=============================================================
    // Equipment Reference (via Navigation)
    //=============================================================
    UI.FieldGroup #EquipmentRef : {
        $Type : 'UI.FieldGroupType',
        Data : [
            { $Type : 'UI.DataField', Label : 'Equipment ID', Value : equipment_ID },
            { $Type : 'UI.DataField', Label : 'Equipment Name', Value : equipment.description },
            { $Type : 'UI.DataField', Label : 'Manufacturer', Value : equipment.manufacturer },
            { $Type : 'UI.DataField', Label : 'Model No', Value : equipment.modelNumber },
            { $Type : 'UI.DataField', Label : 'Location', Value : equipment.functionalLocation }
        ]
    },

    //=============================================================
    // Functional Location Reference (via Navigation)
    //=============================================================
    UI.FieldGroup #FuncLocRef : {
        $Type : 'UI.FieldGroupType',
        Data : [
            { $Type : 'UI.DataField', Label : 'Functional Location', Value : funcLoc_ID },
            { $Type : 'UI.DataField', Label : 'Description', Value : funcLoc.description },
            { $Type : 'UI.DataField', Label : 'Area Type', Value : funcLoc.locationType },
            { $Type : 'UI.DataField', Label : 'Plant', Value : funcLoc.plant }
        ]
    },

    //=============================================================
    // Facets: Clean, Business-Oriented Layout
    //=============================================================
    UI.Facets : [
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'General',
            Label  : 'Notification Overview',
            Facets : [
                { $Type : 'UI.ReferenceFacet', Label : 'Summary', Target : '@UI.FieldGroup#NotifSummary' }
            ]
        },
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'MasterRefs',
            Label  : 'Master References',
            Facets : [
                { $Type : 'UI.ReferenceFacet', Label : 'Equipment', Target : '@UI.FieldGroup#EquipmentRef' },
                { $Type : 'UI.ReferenceFacet', Label : 'Functional Location', Target : '@UI.FieldGroup#FuncLocRef' },
            ]
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'NotificationItemsFacet',
            Label : 'Notification Items',
            Target: 'notificationItems/@UI.LineItem'
        }
    ],

    //=============================================================
    // List Report
    //=============================================================
    UI.LineItem : [
        { $Type : 'UI.DataField', Label : 'Notification ID', Value : ID },
        { $Type : 'UI.DataField', Label : 'Type', Value : notifType },
        { $Type : 'UI.DataField', Label : 'Equipment', Value : equipment.description },
        { $Type : 'UI.DataField', Label : 'Functional Location', Value : funcLoc.description },
        { $Type : 'UI.DataField', Label : 'Priority', Value : priority },
        { $Type : 'UI.DataField', Label : 'Status', Value : status },
        { $Type : 'UI.DataField', Label : 'Plant', Value : plant}
    ]
);

//===================================================================
// Notification Items – Level 2
//===================================================================
annotate service.NotificationItems with @(
    UI.HeaderInfo : {
        TypeName       : 'Notification Item',
        TypeNamePlural : 'Notification Items',
        Title          : { Value : description },
        Description    : { Value : severity }
    },

    UI.LineItem : [
        { $Type : 'UI.DataField', Label : 'Damage Code', Value : damageCode },
        { $Type : 'UI.DataField', Label : 'Cause Code', Value : causeCode },
        { $Type : 'UI.DataField', Label : 'Description', Value : description },
        { $Type : 'UI.DataField', Label : 'Severity', Value : severity },
        { $Type : 'UI.DataField', Label : 'Safety Related', Value : isSafetyRelated },
        { $Type : 'UI.DataField', Label : 'Status', Value : status }
    ],

    UI.Facets : [
        { $Type : 'UI.ReferenceFacet', Label : 'Tasks', Target : 'items/@UI.LineItem' }
    ]
);

//===================================================================
// Maintenance Tasks – Level 3
//===================================================================
annotate service.MaintanenceTasks with @(
    UI.HeaderInfo : {
        TypeName       : 'Maintenance Task',
        TypeNamePlural : 'Maintenance Tasks',
        Title          : { Value : taskText },
        Description    : { Value : status }
    },

    UI.LineItem : [
        { $Type : 'UI.DataField', Label : 'Task Text', Value : taskText },
        { $Type : 'UI.DataField', Label : 'Assigned To', Value : assignedTo },
        { $Type : 'UI.DataField', Label : 'Duration (Hrs)', Value : durationHrs },
        { $Type : 'UI.DataField', Label : 'Unit', Value : UoM },
        { $Type : 'UI.DataField', Label : 'Start', Value : startDate },
        { $Type : 'UI.DataField', Label : 'End', Value : endDate },
        { $Type : 'UI.DataField', Label : 'Status', Value : status }
    ]
);
