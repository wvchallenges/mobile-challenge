import React, { Component, PropTypes } from 'react';
import { ListView } from 'react-native';
import Product from './Product';

const ds = new ListView.DataSource({
  rowHasChanged: (r1, r2) => r1 !== r2,
});

class Products extends Component {
  constructor(props) {
    super(props);
    this.state = {
      dataSource: ds.cloneWithRows(props.products),
    };
  }

  componentDidMount() {
    const { onMount } = this.props;
    onMount();
  }

  componentWillReceiveProps(nextProps) {
    this.setState({
      dataSource: ds.cloneWithRows(nextProps.products),
    });
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
  onMount: PropTypes.func,
};

export default Products;
