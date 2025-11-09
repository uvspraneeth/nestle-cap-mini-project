namespace nestle.manufacturing.common;

type Plant : String(4);

type PriorityLevels : String(10) enum {
    Low;
    Medium;
    High;
    Critical;
};

type IsActive : Boolean;
type UoM      : String(3);
