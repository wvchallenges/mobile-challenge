import React, { Component, PropTypes } from 'react';
import { ListView, StyleSheet, View } from 'react-native';
import Product from './Product';

const ds = new ListView.DataSource({
  rowHasChanged: (r1, r2) => r1 !== r2,
});

const styles = StyleSheet.create({
  separator: {
    height: StyleSheet.hairlineWidth,
    backgroundColor: '#8E8E8E',
  },
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
        renderSeparator={(sectionId, rowId) => <View key={rowId} style={styles.separator} />}
      />
    );
  }
}

Products.propTypes = {
  products: PropTypes.array,
  onMount: PropTypes.func,
};

export default Products;
