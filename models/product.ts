export default interface Product {
  id: number;
  url: string;
  name: string;
  price: number;
  is_sold: boolean;
  is_bought: boolean;
  income_account: object;
  expense_account: object;
  active: boolean;
  date_created: string;
  date_modified: string;
  description: string;
  default_sales_taxes: number[];
};