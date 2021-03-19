describe('Products screen', () => {
  beforeAll(async () => {
    await device.launchApp();
  });

  beforeEach(async () => {
    await device.reloadReactNative();
  });

  it.only('should load data from backend', async () => {
    await expect(element(by.id('productContainer'))).toBeVisible();
    await expect(element(by.id('item0'))).toBeVisible();
  });
});
