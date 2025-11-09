using NestlePPPMPublicService as service from '../../srv/nestle-pppm-service';
annotate service.MaintNotifications with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'ID',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'notifType',
                Value : notifType,
            },
            {
                $Type : 'UI.DataField',
                Label : 'notifDate',
                Value : notifDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'priority',
                Value : priority,
            },
            {
                $Type : 'UI.DataField',
                Label : 'shortText',
                Value : shortText,
            },
            {
                $Type : 'UI.DataField',
                Label : 'LongText',
                Value : LongText,
            },
            {
                $Type : 'UI.DataField',
                Label : 'status',
                Value : status,
            },
            {
                $Type : 'UI.DataField',
                Label : 'plant',
                Value : plant,
            },
            {
                $Type : 'UI.DataField',
                Label : 'reportedBy',
                Value : reportedBy,
            },
            {
                $Type : 'UI.DataField',
                Label : 'reportedOn',
                Value : reportedOn,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'ID',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'notifType',
            Value : notifType,
        },
        {
            $Type : 'UI.DataField',
            Label : 'notifDate',
            Value : notifDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'priority',
            Value : priority,
        },
        {
            $Type : 'UI.DataField',
            Label : 'shortText',
            Value : shortText,
        },
    ],
);

