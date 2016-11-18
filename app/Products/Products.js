import React, { Component, PropTypes } from 'react';
import { ListView } from 'react-native';
import Product from './Product';

class Products extends Component {
  constructor(props) {
    super(props);
    console.log(props);
    const ds = new ListView.DataSource({
      rowHasChanged: (r1, r2) => r1 !== r2,
    });
    this.state = {
      dataSource: ds.cloneWithRows(['row 1', 'row 2']),
    };
  }

  render() {
    return (
      <ListView
        dataSource={this.state.dataSource}
        renderRow={row => <Product product={row} />}
      />
    );
  }
}

Products.propTypes = {
  products: PropTypes.array,
};

export default Products;
