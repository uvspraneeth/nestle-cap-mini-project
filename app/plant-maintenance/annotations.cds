using NestlePPPMPublicService as service from '../../srv/nestle-pppm-service';

//===================================================================
// MAINTENANCE NOTIFICATIONS (Level 1)
//===================================================================
annotate service.MaintNotifications with @(
    UI.HeaderInfo: {
        TypeName: 'Maintenance Notification',
        TypeNamePlural: 'Maintenance Notifications',
        Title: { Value: ID },
        Description: { Value: notifType }
    },

    UI.Facets: [
        { $Type: 'UI.ReferenceFacet', Label: 'General Information', Target: '@UI.FieldGroup#GeneralInfo' },
        { $Type: 'UI.ReferenceFacet', Label: 'Notification Items', Target: 'items/@UI.LineItem' }
    ],

    UI.FieldGroup #GeneralInfo: {
        Data: [
            { $Type: 'UI.DataField', Label: 'Notification ID', Value: ID },
            { $Type: 'UI.DataField', Label: 'Notification Type', Value: notifType },
            { $Type: 'UI.DataField', Label: 'Priority', Value: priority },
            { $Type: 'UI.DataField', Label: 'Status', Value: status },
            { $Type: 'UI.DataField', Label: 'Reported By', Value: reportedBy },
            { $Type: 'UI.DataField', Label: 'Reported On', Value: reportedOn },
            { $Type: 'UI.DataField', Label: 'Plant', Value: plant }
        ]
    },

    UI.LineItem: [
        { $Type: 'UI.DataField', Label: 'Notification ID', Value: ID },
        { $Type: 'UI.DataField', Label: 'Type', Value: notifType },
        { $Type: 'UI.DataField', Label: 'Priority', Value: priority },
        { $Type: 'UI.DataField', Label: 'Status', Value: status },
        { $Type: 'UI.DataField', Label: 'Plant', Value: plant }
    ]
);

//===================================================================
// NOTIFICATION ITEMS (Level 2)
//===================================================================
annotate service.NotificationItems with @(
    UI.HeaderInfo: {
        TypeName: 'Notification Item',
        TypeNamePlural: 'Notification Items',
        Title: { Value: description },
        Description: { Value: severity }
    },

    UI.Facets: [
        { $Type: 'UI.ReferenceFacet', Label: 'Item Details', Target: '@UI.FieldGroup#ItemDetails' },
        { $Type: 'UI.ReferenceFacet', Label: 'Maintenance Tasks', Target: 'tasks/@UI.LineItem' }
    ],

    UI.FieldGroup #ItemDetails: {
        Data: [
            { $Type: 'UI.DataField', Label: 'Item ID', Value: ID },
            { $Type: 'UI.DataField', Label: 'Damage Code', Value: damageCode },
            { $Type: 'UI.DataField', Label: 'Cause Code', Value: causeCode },
            { $Type: 'UI.DataField', Label: 'Description', Value: description },
            { $Type: 'UI.DataField', Label: 'Severity', Value: severity },
            { $Type: 'UI.DataField', Label: 'Safety Related', Value: isSafetyRelated },
            { $Type: 'UI.DataField', Label: 'Status', Value: status }
        ]
    },

    UI.LineItem: [
        { $Type: 'UI.DataField', Label: 'Damage Code', Value: damageCode },
        { $Type: 'UI.DataField', Label: 'Cause Code', Value: causeCode },
        { $Type: 'UI.DataField', Label: 'Description', Value: description },
        { $Type: 'UI.DataField', Label: 'Severity', Value: severity },
        { $Type: 'UI.DataField', Label: 'Status', Value: status }
    ]
);

//===================================================================
// MAINTENANCE TASKS (Level 3)
//===================================================================
annotate service.MaintanenceTasks with @(
    UI.HeaderInfo: {
        TypeName: 'Maintenance Task',
        TypeNamePlural: 'Maintenance Tasks',
        Title: { Value: taskText },
        Description: { Value: status }
    },

    UI.Facets: [
        { $Type: 'UI.ReferenceFacet', Label: 'Task Details', Target: '@UI.FieldGroup#TaskDetails' }
    ],

    UI.FieldGroup #TaskDetails: {
        Data: [
            { $Type: 'UI.DataField', Label: 'Task ID', Value: ID },
            { $Type: 'UI.DataField', Label: 'Task Text', Value: taskText },
            { $Type: 'UI.DataField', Label: 'Assigned To', Value: assignedTo },
            { $Type: 'UI.DataField', Label: 'Start Date', Value: startDate },
            { $Type: 'UI.DataField', Label: 'End Date', Value: endDate },
            { $Type: 'UI.DataField', Label: 'Duration (Hrs)', Value: durationHrs },
            { $Type: 'UI.DataField', Label: 'UoM', Value: UoM },
            { $Type: 'UI.DataField', Label: 'Status', Value: status }
        ]
    },

    UI.LineItem: [
        { $Type: 'UI.DataField', Label: 'Task Text', Value: taskText },
        { $Type: 'UI.DataField', Label: 'Assigned To', Value: assignedTo },
        { $Type: 'UI.DataField', Label: 'Duration', Value: durationHrs },
        { $Type: 'UI.DataField', Label: 'UoM', Value: UoM },
        { $Type: 'UI.DataField', Label: 'Status', Value: status }
    ]
);
