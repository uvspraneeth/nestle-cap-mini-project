namespace com.nestle.manufacturing.pp.materials;

using {
    nestle.manufacturing.common.Plant,
    nestle.manufacturing.common.IsActive,
    nestle.manufacturing.common.UoM
} from '../../common/types';

/*
MaterialID – internal material number (e.g., 10000012)

MaterialDescription – long text

BaseUoM – base unit of measure

MaterialGroup – for reporting (e.g., “Dairy Ingredients”, “Packaging”)

Plant – plant code where the material is managed

MaterialType – FG (finished good), RM (raw material), PM (packaging)

GrossWeight, NetWeight

StorageLocation (optional)

IsActive – for filtering discontinued items

*/
type MaterialTypes  : String enum {
    FG = 'finished good';
    RM = 'raw material';
    PM = 'packaging'
}

type MaterialGroups : String enum {
    DairyIngredients = 'Dairy Ingredients';
    Packaging = 'Packaging'
};


entity MaterialMaster {
    key ID          : String(7);
        materialDescription : String;
        UoM                 : UoM;
        materialGroup       : MaterialGroups;
        plant               : Plant;
        materialType        : MaterialTypes;
        grossWeight         : Integer;
        netWeight           : Integer;
        isActive            : IsActive
}
