export default class Utils {
  //Utility class for common operation
  static getCurrencyFormat(val: number) {
    let formatter = new Intl.NumberFormat('en-US', {
      style: 'currency',
      currency: 'USD',
    });
    return formatter.format(val); 
  }
}