// To parse this data:
//
//   import { Convert } from "./file";
//
//   const product = Convert.toProduct(json);

export interface Product {
    id:                  number;
    url:                 string;
    name:                string;
    price:               number;
    description:         string;
    is_sold:             boolean;
    is_bought:           boolean;
    income_account:      EAccount | null;
    expense_account:     EAccount | null;
    active:              boolean;
    date_created:        Date;
    date_modified:       Date;
    default_sales_taxes: any[];
}

export interface EAccount {
    id:  number;
    url: string;
}

// Converts JSON strings to/from your types
export class Convert {
    public static toProduct(json: string): Product[] {
        return JSON.parse(json);
    }

    public static productToJson(value: Product[]): string {
        return JSON.stringify(value);
    }
}
