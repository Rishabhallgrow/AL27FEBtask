pageextension 70100 SalesOrderPageExt extends "Sales Order"
{
    layout
    {
        addlast(General)
        {
            field("Count of SO"; Rec."Count of SO")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }

}
