using NestlePPPMPublicService as service from '../../srv/nestle-pppm-service';
annotate service.ProductOrders with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Id}',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Plant}',
                Value : plant,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Ordertypecode}',
                Value : orderTypeCode,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Orderqty}',
                Value : orderQty,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Unitofmeasure}',
                Value : unitOfMeasure,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Startdate}',
                Value : startDate,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Duedate}',
                Value : dueDate,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Status}',
                Value : status,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Priority}',
                Value : priority,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Createdby}',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Createdon}',
                Value : createdOn,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : '{i18n>GeneralInformation}',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Id}',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Plant}',
            Value : plant,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Ordertypecode}',
            Value : orderTypeCode,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Orderqty}',
            Value : orderQty,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Unitofmeasure}',
            Value : unitOfMeasure,
        },
    ],
);

