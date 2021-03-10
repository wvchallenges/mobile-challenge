import 'react-native';
import React from 'react';
import ProductsList from './productsList';

// Note: test renderer must be required after react-native.
import renderer from 'react-test-renderer';
describe('<ProductsList />', () => {
  it('renders correctly', () => {
    const tree = renderer.create(<ProductsList />).toJSON();
    expect(tree.children.length).toBe(1);
  });
});
