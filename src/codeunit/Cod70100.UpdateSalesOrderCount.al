codeunit 70108 UpdateSalesOrderCount
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterValidateEvent', 'Sell-to Customer No.', true, true)]
    local procedure OnAfterValidateSellToCustomerNo(var Rec: Record "Sales Header")
    var
        SalesHeaderRec: Record "Sales Header";
    begin
        if Rec."Sell-to Customer No." = '' then
            exit;

        SalesHeaderRec.Reset();
        SalesHeaderRec.SetRange("Sell-to Customer No.", Rec."Sell-to Customer No.");
        SalesHeaderRec.SetRange("Document Type", SalesHeaderRec."Document Type"::Order);
        SalesHeaderRec.SetFilter(Status, '<>%1', SalesHeaderRec.Status::"Pending Prepayment");

        Rec."Count of SO" := SalesHeaderRec.Count();
    end;
}
